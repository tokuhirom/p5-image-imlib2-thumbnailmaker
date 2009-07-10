use inc::Module::Install;
name 'Image-Imlib2-ThumbnailMaker';
all_from 'lib/Image/Imlib2/ThumbnailMaker.pm';

can_cc or die "This module requires a C compiler";
cc_lib_links 'Imlib2';
makemaker_args(
    OBJECT => '$(O_FILES)',
    clean => {
        FILES => q{
            *.stackdump
            *.gcov *.gcda *.gcno
            *.out
            nytprof
            cover_db
        },
    },
);

test_requires 'Image::Size';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
