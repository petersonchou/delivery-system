<div class="span3" id="sidebar">
    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
<!--         <li class="listall active">
    <a href="index.html"><i class="icon-chevron-right"></i> <i class="icon-th-list"></i> 所有稿件</a>
</li> -->
        <li class="wait active">
            <a href="./index.html"><i class="icon-chevron-right"></i> <i class="icon-envelope"></i> 待审核&nbsp;&nbsp;<span class="badge badge-warning pull-right">{$info["unsolved"]}</span></a>
        </li>
        <li class="passed">
            <a href="./passed.html"><i class="icon-chevron-right"></i> <i class="icon-ok-circle"></i> 已通过&nbsp;&nbsp;<span class="badge badge-success pull-right">{$info["ok"]}</span></a>
        </li>
        <li class="denied">
            <a href="./denied.html"><i class="icon-chevron-right"></i> <i class="icon-remove"></i> 拒绝&nbsp;&nbsp;<span class="badge badge-important pull-right">{$info["fail"]}</span></a>
        </li>        
        <li class="statistic">
            <a href="./statistic.html"><i class="icon-chevron-right"></i> <i class="icon-list-alt"></i> 统计信息</a>
        </li>                        
    </ul>
</div>