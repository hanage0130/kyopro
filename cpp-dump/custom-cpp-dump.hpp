// https://zenn.dev/sassan/articles/4878e79272ed61#%E7%AB%B6%E3%83%97%E3%83%AD%E3%81%A7%E3%81%AE%E4%BE%BF%E5%88%A9%E3%81%AA%E4%BD%BF%E3%81%84%E6%96%B9

#include "cpp-dump.hpp"
#define dump(...) cpp_dump(__VA_ARGS__)
namespace cp = cpp_dump;
CPP_DUMP_SET_OPTION_GLOBAL(max_line_width, 80);
CPP_DUMP_SET_OPTION_GLOBAL(log_label_func, cp::log_label::filename());
CPP_DUMP_SET_OPTION_GLOBAL(enable_asterisk, true);
