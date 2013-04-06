$lib_dir = "/Users/beata/dev/src/lib"

$configure = {

  :admin_libs => {
    :output => "../admin_libs.min.js",
    :files => [
      $lib_dir + "/css/bootstrap/js/bootstrap-transition.js",
      $lib_dir + "/css/bootstrap/js/bootstrap-modal.js",
      $lib_dir + "/css/bootstrap/js/bootstrap-typeahead.js",
      $lib_dir + "/javascript/mustache.js/jquery.mustache.js",
      $lib_dir + "/javascript/jquery-validation/jquery.validate.js",
      $lib_dir + "/javascript/bootstrap-datepicker/js/bootstrap-datepicker.js",
      $lib_dir + "/javascript/bootstrap-modal/js/bootstrap-modalmanager.js",
      $lib_dir + "/javascript/bootstrap-modal/js/bootstrap-modal.js",
      $lib_dir + "/custom/plugins/rangeselect.js",
    ]
  },

  :admin => {
    :output => "../admin.min.js",
    :files => [
      $lib_dir + "/custom/snippets/jquery.validate.additional-methods.custom.js",
      $lib_dir + "/custom/snippets/jquery.validate.setup.js",
      $lib_dir + "/custom/snippets/actions.js",
      "./admin.js"
    ]
  },

  :updateIE => {
    :output => "../update.ie.min.js",
    :files => [
      $lib_dir + "/custom/plugins/update.ie.js"
    ]
  }

}
