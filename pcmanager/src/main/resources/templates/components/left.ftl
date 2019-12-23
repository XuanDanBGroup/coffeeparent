<div class="sidebar-menu toggle-others fixed">
    <div class="sidebar-menu-inner">
        <header class="logo-env">
            <div class="logo">
                <a href="#" class="logo-expanded">
                    <img src="assets/images/8899.png" width="170" alt=""/>
                </a>
            </div>
        </header>

        <ul id="main-menu" class="main-menu">
            <li>
                <a href="/householdList">
                    <i class="linecons-star"></i>
                    <span class="title">首页</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="linecons-cog"></i>
                    <span class="title">户信息管理</span>
                </a>
                <ul>
                    <li>
                        <a href="/householdList">
                            <span class="title">户信息列表</span>
                        </a>
                    </li>
                    <#if user.role==1>
                        <li>
                            <a href="/addHousehold">
                                <span class="title">新增户信息</span>
                            </a>
                        </li>
                    </#if>
                </ul>
            </li>
            <#if user.role==1>
                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">设备管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/equipmentList">
                                <span class="title">设备列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </#if>
            <li>
                <a href="#">
                    <i class="linecons-cog"></i>
                    <span class="title">统计</span>
                </a>
                <ul>
                    <#if user.role==1>
                        <li>
                            <a href="/regionalStatistics">
                                <span class="title">区域统计</span>
                            </a>
                        </li>
                        <li>
                            <a href="/firmStatistics">
                                <span class="title">厂家统计</span>
                            </a>
                        </li>
                    </#if>
                    <li>
                        <a href="/engineeringStatistics">
                            <span class="title">工程统计</span>
                        </a>
                    </li>
                </ul>
            </li>
            <#if user.role==1>
                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">监测数据</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/temperatureMonitor">
                                <span class="title">室温实时数据</span>
                            </a>
                        </li>
                        <li>
                            <a href="/electricityMonitor">
                                <span class="title">区域用电趋势</span>
                            </a>
                        </li>
                        <li>
                            <a href="/switchList">
                                <span class="title">智能开关列表</span>
                            </a>
                        </li>
                        <li>
                            <a href="/frequencySetting">
                                <span class="title">采集频次设置</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">计划任务管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/taskAllocation">
                                <span class="title">计划任务分配</span>
                            </a>
                        </li>
                        <li>
                            <a href="/taskCharts">
                                <span class="title">进度完成图表</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">账号管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/accountList">
                                <span class="title">账号列表</span>
                            </a>
                        </li>
<#--                        <li>-->
<#--                            <a href="/roleList">-->
<#--                                <span class="title">角色列表</span>-->
<#--                            </a>-->
<#--                        </li>-->
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">工程小组管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/teamList">
                                <span class="title">工程小组列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="linecons-cog"></i>
                        <span class="title">意见反馈管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="/feedbackList">
                                <span class="title">意见反馈列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </#if>
        </ul>
    </div>
</div>
