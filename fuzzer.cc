#include <cassert>
#include <fstream>
#include "tree_sitter/api.h"

extern "C" const TSLanguage *tree_sitter_hcl();

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
  const char *str = reinterpret_cast<const char *>(data);

  TSParser *parser = ts_parser_new();
  assert(ts_parser_set_language(parser, tree_sitter_hcl()));

  TSTree *tree = ts_parser_parse_string(parser, NULL, str, size);

  ts_tree_delete(tree);
  ts_parser_delete(parser);
  return 0;
}
