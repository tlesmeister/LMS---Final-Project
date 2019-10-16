using System.Web.Optimization;

namespace JobBoardLMS.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js",
            //          "~/Scripts/respond.js"));

            //NEW ONE
            bundles.Add(new ScriptBundle("~/bundles/template").Include(
                      "~/Scripts/js/jquery-3.3.1.min.js"
                      , "~/Scripts/js/jquery-migrate-3.0.1.min.js"
                      , "~/Scripts/js/jquery-ui.js"
                      , "~/Scripts/js/popper.min.js"
                      , "~/Scripts/js/bootstrap.min.js"
                      , "~/Scripts/js/owl.carousel.min.js"
                      , "~/Scripts/js/jquery.stellar.min.js"
                      , "~/Scripts/js/jquery.countdown.min.js"
                      , "~/Scripts/js/bootstrap-datepicker.min.js"
                      , "~/Scripts/js/jquery.easing.1.3.js"
                      , "~/Scripts/js/aos.js"
                      , "~/Scripts/js/jquery.fancybox.min.js"
                      , "~/Scripts/js/jquery.sticky.js"
                      , "~/Scripts/js/jquery.mb.YTPlayer.min.js"
                      , "~/Scripts/js/main.js"
                      , "~/Scripts/js/lms.js"
                      , "~/Scripts/bootstrap.js"
                      , "~/Scripts/bootstrap.min.js"
                      , "~/Scripts/jquery.dataTables.min.js" //added for jQuery Datatables
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/css/bootstrap.css"
                      , "~/Content/fonts/icomoon/style.css"
                      , "~/Content/css/bootstrap.min.css"
                      , "~/Content/css/jquery-ui.css"
                      , "~/Content/css/owl.carousel.min.css"
                      , "~/Content/css/owl.theme.default.min.css"
                      , "~/Content/css/jquery.fancybox.min.css"
                      , "~/Content/css/bootstrap-datepicker.css"
                      , "~/Content/fonts/flaticon/font/flaticon.css"
                      , "~/Content/css/aos.css"
                      , "~/Content/css/jquery.mb.YTPlayer.min.css"
                      , "~/Content/css/jquery.dataTables.min.css" //added for jQuery datatables style after Nuget
                      , "~/Content/PagedList.css" //Added for MVC Paging after Nuget
                      , "~/Content/css/site.css"
                      , "~/Content/css/style.css"
                      , "~/Content/css/customstyle.css"));
        }
    }
}
