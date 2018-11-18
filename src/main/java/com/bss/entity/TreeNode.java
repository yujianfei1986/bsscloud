package com.bss.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yujianfei on 2017/8/30.
 * id: An identity value bind to the node.
 * text: Text to be showed.
 * iconCls: The css class to display icon.
 * checked: Whether the node is checked.
 * state: The node state, 'open' or 'closed'.
 * attributes: Custom attributes bind to the node.
 * target: Target DOM object.
 */
public class TreeNode implements Serializable {
    private static final long serialVersionUID = -6655099035115524479L;
    private String id;
    private String text;
    private String iconCls;
    private List<TreeNode> children = new ArrayList<TreeNode>();
    private String state = "open";
    private boolean isLeaf;
    private boolean checked;
    private Map<String, String> attributes = new HashMap<String, String>();
    private Map<String, Object> attrs = new HashMap<String, Object>();

    /**
     * 通过递归拼装树形数据
     *
     * @param pNode    父节点
     * @param allNodes 所有的节点数据
     */
    public static void recursionToCreateChildNode(TreeNode pNode, List<TreeNode> allNodes) {
        for (TreeNode n : allNodes) {
            if (pNode.getId().equals(n.getPid())) {
                recursionToCreateChildNode(n, allNodes);
                pNode.getChildren().add(n);
            }
        }
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public boolean isLeaf() {
        return isLeaf;
    }

    public void setLeaf(boolean isLeaf) {
        this.isLeaf = isLeaf;
    }

    public Map<String, Object> getAttrs() {
        return attrs;
    }

    public void setAttrs(Map<String, Object> attrs) {
        this.attrs = attrs;
    }

    private String pid;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public List<TreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Map<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }
}
