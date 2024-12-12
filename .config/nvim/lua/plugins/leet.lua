return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Leet",
  opts = {
    plugins = {
      non_standalone = false,
    },
    injector = {
      ["cpp"] = {
        before = {
          "#include <bits/stdc++.h>",
          "using namespace std;",

          "struct TreeNode {",
          "  int val;",
          "  TreeNode* left;",
          "  TreeNode* right;",
          "  TreeNode() : val(0), left(nullptr), right(nullptr) {}",
          "  TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}",
          "  TreeNode(int x, TreeNode *left, TreeNode *right)",
          "  : val(x), left(left), right(right) {}",
          "};",

          "struct ListNode {",
          "  int val;",
          "  ListNode* next;",
          "  ListNode(int x) : val(x), next(NULL) {}",
          "  ListNode(int x, ListNode* next) : val(x), next(next) {}",
          "};",
        },
        after = {
          "int main() {",
          "  ios_base::sync_with_stdio(false);",
          "  cin.tie(NULL);",
          "  Solution s;",
          "  return 0;",
          "}",
        },
      },
      ["java"] = {
        before = "import java.util.*;",
      },
    },
  },
}
