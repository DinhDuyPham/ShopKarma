using System.Web;
using System.Web.Optimization;

namespace KarmaShop.App_Start
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));
            //Add style to bundles for private pages...
            bundles.Add(new StyleBundle("~/bundles/css1").Include("~/Areas/Admin/Contenss/css/animate.css",
                                                                    "~/Areas/Admin/Contenss/css/bootstrap.css",
                                                                    "~/Areas/Admin/Contenss/css/custom.css",
                                                                    "~/Areas/Admin/Contenss/css/export.css",
                                                                    "~/Areas/Admin/Contenss/css/font-awesome.css",
                                                                    "~/Areas/Admin/Contenss/css/graph.css",
                                                                    "~/Areas/Admin/Contenss/css/jqcandlestick.css",
                                                                    "~/Areas/Admin/Contenss/css/monthly.css",
                                                                    "~/Areas/Admin/Contenss/css/owl.carousel.css",
                                                                    "~/Areas/Admin/Contenss/css/SidebarNav.min.css",
                                                                    "~/Areas/Admin/Contenss/css/style.css"));
            //Add style to bundles for public pages...
            bundles.Add(new StyleBundle("~/bundles/css2").Include("~/Content/css/availability-calendar.css",
                                                                    "~/Content/css/font-awesome.min.css",
                                                                    "~/Content/css/bootstrap.css",
                                                                    "~/Content/css/ion.rangeSlider.css",
                                                                    "~/Content/css/ion.rangeSlider.skinFlat.css",
                                                                    "~/Content/css/jquerysctipttop.css",
                                                                    "~/Content/css/linearicons.css",
                                                                    "~/Content/css/magnific-popup.css",
                                                                    "~/Content/css/main.css",
                                                                    "~/Content/css/nice-select.css",
                                                                    "~/Content/css/nouislider.min.css",
                                                                    "~/Content/css/owl.carousel.css",
                                                                    "~/Content/css/themify-icons.css" ));
            //Add scrip to the bundle for private pages...
            bundles.Add(new StyleBundle("~/bundles/js1").Include("~/Areas/Admin/Contenss/js/amcharts.js",
                                                                "~/Areas/Admin/Contenss/js/bootstrap.js",
                                                                "~/Areas/Admin/Contenss/js/Chart.bundle.js",
                                                                "~/Areas/Admin/Contenss/js/Chart.js",
                                                                "~/Areas/Admin/Contenss/js/Chart.min.js",
                                                                "~/Areas/Admin/Contenss/js/chartinator.js",
                                                                "~/Areas/Admin/Contenss/js/classie.js",
                                                                "~/Areas/Admin/Contenss/js/custom.js",
                                                                "~/Areas/Admin/Contenss/js/export.min.js",
                                                                "~/Areas/Admin/Contenss/js/index.js",
                                                                "~/Areas/Admin/Contenss/js/index1.js",
                                                                "~/Areas/Admin/Contenss/js/index2.js",
                                                                "~/Areas/Admin/Contenss/js/jquery-1.11.1.min.js",
                                                                "~/Areas/Admin/Contenss/js/jquery.flot.js",
                                                                "~/Areas/Admin/Contenss/js/jquery.jqcandlestick.min.js",
                                                                "~/Areas/Admin/Contenss/js/jquery.nicescroll.js",
                                                                "~/Areas/Admin/Contenss/js/light.js",
                                                                "~/Areas/Admin/Contenss/js/metisMenu.min.js",
                                                                "~/Areas/Admin/Contenss/js/modernizr.custom.js",
                                                                "~/Areas/Admin/Contenss/js/monthly.js",
                                                                "~/Areas/Admin/Contenss/js/owl.carousel.js",
                                                                "~/Areas/Admin/Contenss/js/pie-chart.js",
                                                                "~/Areas/Admin/Contenss/js/scripts.js",
                                                                "~/Areas/Admin/Contenss/js/serial.js",
                                                                "~/Areas/Admin/Contenss/js/SidebarNav.min.js",
                                                                "~/Areas/Admin/Contenss/js/SimpleChart.js",
                                                                "~/Areas/Admin/Contenss/js/utils.js",
                                                                "~/Areas/Admin/Contenss/js/validator.min.js"));

            //Add scrips to the bundles for public pages ...
            bundles.Add(new StyleBundle("~/bundles/js2").Include("~/Content/js/vendor/bootstrap.min.js",
                                                                "~/Content/js/vendor/jquery-2.2.4.min.js",
                                                                "~/Content/js/vendor/popper.js",
                                                                "~/Content/js/countdown.js",
                                                                "~/Content/js/gmaps.min.js",
                                                                "~/Content/js/ion.rangeSlider.js",
                                                                "~/Content/js/jquery.ajaxchimp.min.js",
                                                                "~/Content/js/jquery.magnific-popup.min.js",
                                                                "~/Content/js/jquery.nice-select.min.js",
                                                                "~/Content/js/jquery.sticky.js",
                                                                "~/Content/js/main.js",
                                                                "~/Content/js/nouislider.min.js",
                                                                "~/Content/js/owl.carousel.min.js",
                                                                "~/Content/js/parallax.min.js"));

        }
    }
}
