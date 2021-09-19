# tree-sitter-hcl-fuzz

Fuzzing seed and instrumentation for [tree-sitter-hcl](https://github.com/MichaHoffmann/tree-sitter-hcl)

To run a fuzzing round against specific revisions of `tree-sitter` and `tree-sitter-hcl`, simply use:

```bash
make fuzz TREE_SITTER_REVISION=master TREE_SITTER_HCL_REVISION=add_template_if_directives
```
