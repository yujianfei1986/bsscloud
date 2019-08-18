package com.bss.service;

import com.bss.dao.IUserDao;
import com.bss.entity.TreeNode;
import com.bss.entity.User;
import com.bss.utils.CommUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by yujianfei on 2017/8/30.
 * 登录
 */
@Service
public class LoginService {

    @Resource
    private IUserDao iUserDao;

    @Transactional(readOnly = true)
    public List<Map<String, Object>> getMenuTree(String root_id, HttpServletRequest request) throws Exception {
        List<Map<String, Object>> treeList = iUserDao.getMenuList();

        for (Map<String, Object> map : treeList) {
            String text = CommUtil.nvl(String.valueOf(map.get("text")));
            String menu_name = CommUtil.nvl(String.valueOf(map.get("menu_name")));
            map.put("text", CommUtil.getI18NStringByKey(text, request));
            map.put("menu_name", CommUtil.getI18NStringByKey(menu_name, request));
        }
        //将treeList变更为前端所需要的树形结构
        treeList = list2TreeList(treeList, root_id);
        return treeList;
    }

    @Transactional(readOnly = true)
    public boolean checkUserLogin(User user, HttpServletRequest request) throws Exception {
        Map<String, Object> userInfoMap = iUserDao.loginSelect(user);
        if (userInfoMap != null && userInfoMap.size() != 0) {
            //最大尝试次数，暂时先写死，5次
            int attempt_times = 5;
            //检查用户状态是否已经锁定
            String status = CommUtil.nvl(userInfoMap.get("STATUS"));
            if ("1".equals(status)) {
                user.setErrInfo(CommUtil.getI18NStringByKey("YiJingBeiTingYong", request));
                return false;
            }

            String pwd = CommUtil.nvl(userInfoMap.get("USER_PASSWD"));
            //密码错误
            if (!user.getUser_passwd().equals(pwd)) {
                Integer pwdErrCount;
                if (request.getSession().getAttribute("pwdErrCount") != null) {
                    pwdErrCount = (Integer) request.getSession().getAttribute("pwdErrCount");
                    pwdErrCount += 1;
                    if (pwdErrCount >= attempt_times) {
                        //1. 锁定用户
                        Map<String, String> map = new HashMap<String, String>();
                        map.put("status", "1");
                        map.put("userId", String.valueOf(userInfoMap.get("USERID")));
                        iUserDao.updateUserLockStatus(map);
                        //2. 建立一个定时任务，根据解锁时间进行自动解锁
                    }
                } else {
                    pwdErrCount = 1;
                }
                request.getSession().setAttribute("pwdErrCount", pwdErrCount);
                int remain_count = attempt_times - pwdErrCount;
                if (remain_count > 0) {
                    user.setErrInfo(CommUtil.getI18NStringByKey("MiMaCuoWuTiShi", request) + remain_count + (remain_count > 1
                            ? CommUtil.getI18NStringByKey("DuoCiJiHui", request) : CommUtil.getI18NStringByKey("JiHui", request)));
                }
                return false;
            }
            //到这里，表示用户未被停用，并且输入密码正确，登录成功
            user.setUserId(String.valueOf(userInfoMap.get("USERID")));
            user.setPasswd_modify_date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(String.valueOf(userInfoMap.get("PASSWD_MODIFY_DATE"))));
            user.setStatus("0");
            user.setIs_super_admin(String.valueOf(userInfoMap.get("IS_SUPER_ADMIN")));
            user.setOperator_code(String.valueOf(userInfoMap.get("OPERATOR_CODE")));
        } else {
            //没有该用户
            user.setErrInfo(CommUtil.getI18NStringByKey("MeiYouFaXianYongHu", request));
            return false;
        }
        return true;
    }

    /*
   * LIST转TreeList
   */
    private List<Map<String, Object>> list2TreeList(List<Map<String, Object>> tList, String root_id) throws Exception {
        Map<String, TreeNode> mt = new HashMap<String, TreeNode>();
        TreeNode etn = new TreeNode();
        mt.put(root_id, etn);
        etn.setId(root_id);
        etn.setText("根节点");
        etn.setLeaf(false);// 根节点，非叶子节点
            /*转换为tree node*/
        treeList2Tree(mt, tList);
        //转换为tree List
        return this.iterNodeList(etn);
    }

    private void treeList2Tree(Map<String, TreeNode> mt, List<Map<String, Object>> treeList) throws Exception {
        Map<String, TreeNode> dbTreeRowMap = new HashMap<String, TreeNode>();
        if (treeList != null && treeList.size() > 0) {
            for (Map<String, Object> dbMap : treeList) {
                dbMap = CommUtil.mapKeyToLower(dbMap);
                TreeNode tree_node = new TreeNode();
                String tree_id = CommUtil.nvl(dbMap.get("id"));
                String tree_name = CommUtil.nvl(dbMap.get("text"));
                String p_tree_id = CommUtil.nvl(dbMap.get("pid"));
                tree_node.setId(tree_id);
                tree_node.setText(tree_name);
                tree_node.setPid(p_tree_id);
                tree_node.setAttrs(dbMap);

                dbTreeRowMap.put(tree_id, tree_node);
            }

            if (dbTreeRowMap.size() != 0) {
                Set key = dbTreeRowMap.keySet(); // 获得key的集合
                Iterator it = key.iterator();
                while (it.hasNext()) {
                    String tree_id = it.next().toString(); // 获得key值
                    TreeNode tree_node = dbTreeRowMap.get(tree_id);
                    if (tree_node == null) continue;
                    String p_tree_id = tree_node.getPid();

                    iterTree(mt, p_tree_id, dbTreeRowMap);

                    TreeNode netn = mt.get(tree_id);
                    if (netn == null) {
                        mt.put(tree_id, tree_node);
                    }
                    if (mt.get(p_tree_id) != null) {//
                        mt.get(p_tree_id).getChildren().add(tree_node);
                    }
                    // 在根节点的attrs中加入“路径”字符串
                    if (String.valueOf(tree_node.getAttrs().get("menu_leaf")).equals("1")) {// 表示该节点为叶子节点
                        String path = tree_node.getText();// 当前节点
                        // 循环查找其父节点，并拼装到"s"上
                        TreeNode pNode = mt.get(tree_node.getPid());
                        while (pNode != null) {
                            if (!pNode.getId().equals("0")) {// 如果是根节点，就不加了
                                path = pNode.getText() + " > " + path;
                            }
                            pNode = mt.get(pNode.getPid());
                        }
                        tree_node.getAttrs().put("path", path);
                    }
                }
            }
        }
    }

    //递归树
    private void iterTree(Map<String, TreeNode> mt, String tree_id, Map<String, TreeNode> dbTreeRowMap) throws Exception {
        if (mt.get(tree_id) != null) return;
        if (dbTreeRowMap != null) {
            TreeNode tree_node = dbTreeRowMap.get(tree_id);
            if (tree_node == null) {
                return;
            }
            String p_tree_id = tree_node.getPid();
            mt.put(tree_id, tree_node);
            iterTree(mt, p_tree_id, dbTreeRowMap);
        }
    }

    /*
    * 递归生成tree的json 所需的List
    */
    private List<Map<String, Object>> iterNodeList(TreeNode pnode) {
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        List<TreeNode> nodeList = pnode.getChildren();
        if (CommUtil.isEmpty(nodeList)) {
            return null;
        }

        for (TreeNode node : nodeList) {
            Map<String, Object> map = node.getAttrs();
            Map<String, String> map2 = CommUtil.mapFormat2Str(map);

            map.put("attributes", map2);
            retList.add(map);
            map.put("state", "open");

            List<Map<String, Object>> chdList = this.iterNodeList(node);
            if (chdList != null) {
                chdList = CommUtil.sortList(chdList, "disp_ord", "int", "asc");//排序
                map.put("children", chdList);
                map.put("state", "closed");//默认父节点关闭
            }
        }

        retList = CommUtil.sortList(retList, "disp_ord", "int", "asc");//排序
        return retList;
    }
}
