#ifdef __cplusplus
extern "C" {
#endif
#include <Imlib2.h>
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#ifdef __cplusplus
}
#endif

static const char * err_messages[] = {
    "IMLIB_LOAD_ERROR_NONE",
    "IMLIB_LOAD_ERROR_FILE_DOES_NOT_EXIST",
    "IMLIB_LOAD_ERROR_FILE_IS_DIRECTORY",
    "IMLIB_LOAD_ERROR_PERMISSION_DENIED_TO_READ",
    "IMLIB_LOAD_ERROR_NO_LOADER_FOR_FILE_FORMAT",
    "IMLIB_LOAD_ERROR_PATH_TOO_LONG",
    "IMLIB_LOAD_ERROR_PATH_COMPONENT_NON_EXISTANT",
    "IMLIB_LOAD_ERROR_PATH_COMPONENT_NOT_DIRECTORY",
    "IMLIB_LOAD_ERROR_PATH_POINTS_OUTSIDE_ADDRESS_SPACE",
    "IMLIB_LOAD_ERROR_TOO_MANY_SYMBOLIC_LINKS",
    "IMLIB_LOAD_ERROR_OUT_OF_MEMORY",
    "IMLIB_LOAD_ERROR_OUT_OF_FILE_DESCRIPTORS",
    "IMLIB_LOAD_ERROR_PERMISSION_DENIED_TO_WRITE",
    "IMLIB_LOAD_ERROR_OUT_OF_DISK_SPACE",
    "IMLIB_LOAD_ERROR_UNKNOWN"
};

MODULE = Image::Imlib2::ThumbnailMaker  PACKAGE = Image::Imlib2::ThumbnailMaker

void
make(const char * src, const char *dst, const char *fmt, int dw, int dh)
CODE:
    {
        Imlib_Image image, scaled;
        Imlib_Load_Error err;
        image = imlib_load_image(src);

        if (image) {
            imlib_context_set_image(image);
            scaled = imlib_create_cropped_scaled_image(0, 0, imlib_image_get_width(), imlib_image_get_height(), dw, dh);
            if (!scaled) {
                Perl_croak("cannot create thumbnail");
            }
            imlib_free_image(); /* free(image); */

            imlib_context_set_image(scaled);
            imlib_image_set_format(fmt);
            imlib_save_image_with_error_return(dst, &err);
            if (err) {
                Perl_croak("error on save %s\n", err_messages[err]);
            }
            imlib_free_image(); /* free(scaled) */
        } else {
            Perl_croak("cannot load file");
        }
    }

