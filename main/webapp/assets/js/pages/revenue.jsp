<%@ taglib prefix="series" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    !function (o) {
        "use strict";

        function e() {
            this.$body = o("body"), this.charts = []
        }

        e.prototype.initCharts = function () {
            window.Apex = {
                chart: {
                    parentHeightOffset: 0,
                    toolbar: {
                        show: !1
                    }
                },
                grid: {
                    padding: {
                        left: 0,
                        right: 0
                    }
                },
                colors: ["#727cf5", "#0acf97", "#fa5c7c", "#ffbc00"]
            };
            var e = ["#727cf5", "#0acf97", "#fa5c7c", "#ffbc00"];
            (r = o("#revenue-chart").data("colors")) && (e = r.split(","));
            var t = {
                chart: {
                    height: 364,
                    type: "line",
                    dropShadow: {
                        enabled: !0,
                        opacity: .2,
                        blur: 7,
                        left: -7,
                        top: 7
                    }
                },
                dataLabels: {
                    enabled: !1
                },
                stroke: {
                    curve: "smooth",
                    width: 4
                },
                series: [{
                    name: "Tuần này",
                    data: ["${requestScope['totalPerDayThisWeek'][0]}",
                        "${requestScope['totalPerDayThisWeek'][1]}",
                        "${requestScope['totalPerDayThisWeek'][2]}",
                        "${requestScope['totalPerDayThisWeek'][3]}",
                        "${requestScope['totalPerDayThisWeek'][4]}",
                        "${requestScope['totalPerDayThisWeek'][5]}",
                        "${requestScope['totalPerDayThisWeek'][6]}"]
                }, {
                    name: "Tuần trước",
                    data: ["${requestScope['totalPerDayPreviousWeek'][0]}",
                        "${requestScope['totalPerDayPreviousWeek'][1]}",
                        "${requestScope['totalPerDayPreviousWeek'][2]}",
                        "${requestScope['totalPerDayPreviousWeek'][3]}",
                        "${requestScope['totalPerDayPreviousWeek'][4]}",
                        "${requestScope['totalPerDayPreviousWeek'][5]}",
                        "${requestScope['totalPerDayPreviousWeek'][6]}"]
                }],
                colors: e,
                zoom: {
                    enabled: !1
                },
                legend: {
                    show: !1
                },
                xaxis: {
                    type: "string",
                    categories: ["Thứ hai", "Thứ ba", "Thứ tư", "Thứ năm", "Thứ sáu ", "Thứ bảy", "Chủ nhật"],
                    tooltip: {
                        enabled: !1
                    },
                    axisBorder: {
                        show: !1
                    }
                },
                yaxis: {
                    labels: {
                        formatter: function (e) {
                            return e + "đ"
                        },
                        offsetX: -15
                    }
                }
            };
            new ApexCharts(document.querySelector("#revenue-chart"), t).render();

            var r;
            e = ["#727cf5", "#0acf97", "#fa5c7c", "#ffbc00", "#ffeaae"];
            (r = o("#average-sales").data("colors")) && (e = r.split(","));
            t = {
                chart: {
                    height: 213,
                    type: "donut"
                },
                legend: {
                    show: !1
                },
                stroke: {
                    colors: ["transparent"]
                },
                <c:set var="name" value=""/>
                <c:set var="percent" value=""/>
                <c:set var="i" value="0"/>
                <c:forEach var="item" items="${categoryPercentList}">
                <c:set var="name" value="${name}   ${i eq 0 ? '':','} '${item.key.name}'" />
                <c:set var="percent" value="${percent} ${i eq 0 ? '': ','} ${item.value}"/>
                <c:set var="i" value="1"/>
                </c:forEach>

                series: [${percent}],
                labels: [${name}],
                colors: e,
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                        legend: {
                            position: "bottom"
                        }
                    }
                }]
            }
            ;
            new ApexCharts(document.querySelector("#average-sales"), t).render()
        }, e.prototype.initMaps = function () {
            0 < o("#world-map-markers").length && o("#world-map-markers").vectorMap({
                map: "world_mill_en",
                normalizeFunction: "polynomial",
                hoverOpacity: .7,
                hoverColor: !1,
                regionStyle: {
                    initial: {
                        fill: "#e3eaef"
                    }
                },
                markerStyle: {
                    initial: {
                        r: 9,
                        fill: "#727cf5",
                        "fill-opacity": .9,
                        stroke: "#fff",
                        "stroke-width": 7,
                        "stroke-opacity": .4
                    },
                    hover: {
                        stroke: "#fff",
                        "fill-opacity": 1,
                        "stroke-width": 1.5
                    }
                },
                backgroundColor: "transparent",
                markers: [{
                    latLng: [40.71, -74],
                    name: "New York"
                }, {
                    latLng: [37.77, -122.41],
                    name: "San Francisco"
                }, {
                    latLng: [-33.86, 151.2],
                    name: "Sydney"
                }, {
                    latLng: [1.3, 103.8],
                    name: "Singapore"
                }],
                zoomOnScroll: !1
            })
        }, e.prototype.init = function () {
            o("#dash-daterange").daterangepicker({
                singleDatePicker: !0
            }), this.initCharts(), this.initMaps()
        }, o.Dashboard = new e, o.Dashboard.Constructor = e
    }(window.jQuery),
        function (t) {
            "use strict";
            t(document).ready(function (e) {
                t.Dashboard.init()
            })
        }(window.jQuery);
</script>