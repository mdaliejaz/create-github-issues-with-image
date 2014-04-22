<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1356929340731" ID="ID_1402422747" MODIFIED="1356930096116" TEXT="Environment Variables">
<font ITALIC="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1356929376255" ID="ID_1850099826" MODIFIED="1356929379789" POSITION="right" TEXT="setup">
<node CREATED="1356929402078" ID="ID_909385180" MODIFIED="1356929407556" TEXT="Environment"/>
<node CREATED="1356929388038" ID="ID_604632392" MODIFIED="1356930126497" TEXT="Pipeline"/>
<node CREATED="1356929408430" ID="ID_1878233417" MODIFIED="1356929411100" TEXT="Stage"/>
<node CREATED="1356929411806" ID="ID_807810214" MODIFIED="1356929413380" TEXT="Job"/>
</node>
<node CREATED="1356929929182" ID="ID_529178633" MODIFIED="1356929947540" POSITION="right" TEXT="values">
<node CREATED="1356929948974" ID="ID_115516198" MODIFIED="1356929953564" TEXT="plain text"/>
<node CREATED="1356929954317" ID="ID_641002400" MODIFIED="1356929996395" TEXT="parameter (Applicable only for plain environment variable)"/>
</node>
<node CREATED="1356929998317" ID="ID_1350659135" MODIFIED="1357100525000" POSITION="right" TEXT="types">
<node CREATED="1356930014621" ID="ID_108380644" MODIFIED="1356930021321" TEXT="Plain Environment Variables"/>
<node CREATED="1356930022198" ID="ID_1393585200" MODIFIED="1356930059593" TEXT="Secured Environment Variables"/>
</node>
<node CREATED="1356930173798" ID="ID_960730639" MODIFIED="1357617264399" POSITION="left" TEXT="verification point">
<node CREATED="1356930182438" ID="ID_361595045" MODIFIED="1356930286379" TEXT="Set up at different levels"/>
<node CREATED="1356930201238" ID="ID_1987197588" MODIFIED="1356930213602" TEXT="Trigger with options"/>
<node CREATED="1356930214270" ID="ID_1938759025" MODIFIED="1356930218468" TEXT="console logs">
<node CREATED="1356930324942" ID="ID_182892114" MODIFIED="1356930382881" TEXT="Starring out of environment variables"/>
<node CREATED="1356930337277" ID="ID_1707418363" MODIFIED="1356930358478" TEXT="Go Related environment variables"/>
<node CREATED="1356930426029" ID="ID_614451262" MODIFIED="1356930437553" TEXT="User defined plain environment variables"/>
</node>
<node CREATED="1356930535262" ID="ID_881197659" MODIFIED="1356930541276" TEXT="Environments page"/>
<node CREATED="1356930816822" ID="ID_583878136" MODIFIED="1356930822492" TEXT="Go Server logs"/>
<node CREATED="1356930822958" ID="ID_613054279" MODIFIED="1356930826164" TEXT="Go Agent logs"/>
</node>
<node CREATED="1356932608638" ID="ID_234139077" MODIFIED="1357186074693" POSITION="left" TEXT="Test Cases">
<node CREATED="1356943531237" ID="ID_183193326" MODIFIED="1357617263261" TEXT="atomic">
<node CREATED="1356943535996" ID="ID_671087545" MODIFIED="1357273493046" TEXT="setup at environment level alone">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356943644700" ID="ID_1328969247" MODIFIED="1357273496758" TEXT="setup at pipeline level alone">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356943557140" ID="ID_1042941416" MODIFIED="1357273500370" TEXT="setup at stage level alone">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356943663333" ID="ID_1855382458" MODIFIED="1357273503666" TEXT="setup at job level alone">
<icon BUILTIN="button_ok"/>
</node>
</node>
<node CREATED="1356943739533" ID="ID_1634740613" MODIFIED="1357185497830" TEXT="runtime modification">
<node CREATED="1356943902884" ID="ID_902100230" MODIFIED="1357273507671" TEXT="modify environment level variable value">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356944129933" ID="ID_1303597073" MODIFIED="1357273511418" TEXT="modify pipeline level variable value">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356944144013" ID="ID_687893083" MODIFIED="1357273522974" TEXT="modify stage level variable value">
<icon BUILTIN="stop-sign"/>
</node>
<node CREATED="1356944154597" ID="ID_430821509" MODIFIED="1357273526594" TEXT="modify job level variable value through trigger with options">
<icon BUILTIN="stop-sign"/>
</node>
</node>
<node CREATED="1356944261381" ID="ID_457314914" MODIFIED="1357185490621" TEXT="combination">
<node CREATED="1356944268284" ID="ID_1647022371" MODIFIED="1357190221565" TEXT="setup different variables at environment, pipeline, stage and job level">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356944301956" ID="ID_566561654" MODIFIED="1357190226728">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Have multipe jobs and multiple stages.
    </p>
    <p>
      setup same environment variables with different values for different stages
    </p>
    <p>
      Verify the runtime behavior
    </p>
  </body>
</html></richcontent>
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356944456076" ID="ID_984714502" MODIFIED="1357190232341" TEXT="Have multipe jobs and multiple stages.&#xa;setup same environment variables with different values for different stages&#xa;Modify the values during runtime and verify what happens.&#xa;&#xa;">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356944549021" ID="ID_251562356" MODIFIED="1357191460104" TEXT="Have the same variable at environment level and pipeline level&#xa;Modify the value to a different one during runtime&#xa;Verify what happens">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356944817236" ID="ID_1277441836" MODIFIED="1357191552488" TEXT="Have the same variable at environment level, pipeline level, stage level, job level&#xa;During runtime modify the values to different one (Trigger with options)&#xa;Verify what happens">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356944928405" ID="ID_1169144894" MODIFIED="1357272503347" TEXT="setup same environment variable at environment level and job level alone&#xa;Verify what happens during runtime">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356944986436" ID="ID_1181475970" MODIFIED="1357272500061" TEXT="setup same environment variables at environment level and pipeline level&#xa;Values are utilized by multiple stages and multiple jobs&#xa;Modify the value during runtime and verify what happens">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356945091549" ID="ID_1712416449" MODIFIED="1357272485807" TEXT="setup same environment variables at enviroment level and stage level&#xa;values are utilized by multiple stages and jobs&#xa;Modify the value during runtime and verify what happens">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356945229868" ID="ID_1964976383" MODIFIED="1357272482016" TEXT="setup same environment variables at enviroment level and stage level&#xa;values are utilized by multiple stages and jobs&#xa;Verify what happens during runtime">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356945268476" ID="ID_988603273" MODIFIED="1357272474152" TEXT="setup same environment variables at pipeline level and stage level&#xa;verify what happens during runtime">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356945302541" ID="ID_1357700849" MODIFIED="1357272467301" TEXT="Setup same environment variables at pipeline level and stage level with different values&#xa;Verify what happens during runtime">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356945856540" ID="ID_1015446751" MODIFIED="1357272429263" TEXT="Setup same environment variables at pipeline level and job level with different values for multi stage and multi job pipeline&#xa;verify what happens during the runtime">
<icon BUILTIN="button_ok"/>
<icon BUILTIN="button_ok"/>
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356946079283" ID="ID_822478627" MODIFIED="1357273407143" TEXT="Setup same environment variables at pipeline level and job level with different values for multi stage and multi job pipeline &#xa;Modify the values during the runtime&#xa;Verify what happens during the runtime">
<icon BUILTIN="button_ok"/>
</node>
</node>
<node CREATED="1356947663108" ID="ID_101119385" MODIFIED="1357187825196" TEXT="integration with other functionalities">
<node CREATED="1356947672725" ID="ID_1868689772" MODIFIED="1357275518150" TEXT="extract templates">
<icon BUILTIN="button_ok"/>
<node CREATED="1356948681588" ID="ID_1356484790" MODIFIED="1356948743186" TEXT="extract templates for all the pipelines setted up in all the above cases"/>
</node>
<node CREATED="1356947697924" ID="ID_1668991401" MODIFIED="1357297172816" TEXT="parameter support">
<icon BUILTIN="button_ok"/>
<node CREATED="1356948746404" ID="ID_1417035655" MODIFIED="1356948772275" TEXT="introduce parameters in all above combination cases and verify what happens"/>
<node CREATED="1356948829108" ID="ID_1354766521" MODIFIED="1356948874248" TEXT="extract templates and create new pipelines using parametrized pipelines"/>
</node>
<node CREATED="1356948223964" ID="ID_1548653878" MODIFIED="1357275522773" TEXT="clone pipeline">
<icon BUILTIN="button_ok"/>
<node CREATED="1356948891981" ID="ID_138072207" MODIFIED="1356948928636" TEXT="clone various pipelines in combination listing"/>
<node CREATED="1356948929852" ID="ID_10291195" MODIFIED="1356948954760" TEXT="clone the various parameterized pipelines"/>
<node CREATED="1356948955428" ID="ID_91971510" MODIFIED="1356948965400" TEXT="clone a pipeline that has been templatized"/>
</node>
<node CREATED="1356948355116" ID="ID_9451302" MODIFIED="1357545176207" TEXT="crud operations">
<icon BUILTIN="button_ok"/>
<node CREATED="1356948469436" ID="ID_216753437" MODIFIED="1356948474779" TEXT="through UI">
<node CREATED="1356948360405" ID="ID_959941025" MODIFIED="1356948395259" TEXT="create/update/delete environment variables defined at environment level"/>
<node CREATED="1356948410796" ID="ID_1027258263" MODIFIED="1356948421141" TEXT="create/update/delete environment variables defined at pipeline level"/>
<node CREATED="1356948440413" ID="ID_1656345956" MODIFIED="1356948449132" TEXT="create/update/delete environment variables defined at stage level"/>
<node CREATED="1356948450381" ID="ID_707290470" MODIFIED="1357545171461" TEXT="create/update/delete environment variables defined at job  level">
<icon BUILTIN="button_ok"/>
</node>
</node>
<node CREATED="1356948492964" ID="ID_1772733505" MODIFIED="1356948497679" TEXT="">
<node CREATED="1356948469436" ID="ID_1656149086" MODIFIED="1356948512859" TEXT="through cruise-config.xml">
<node CREATED="1356948360405" ID="ID_1467512286" MODIFIED="1356948395259" TEXT="create/update/delete environment variables defined at environment level"/>
<node CREATED="1356948410796" ID="ID_1378460216" MODIFIED="1356948421141" TEXT="create/update/delete environment variables defined at pipeline level"/>
<node CREATED="1356948440413" ID="ID_868752426" MODIFIED="1356948449132" TEXT="create/update/delete environment variables defined at stage level"/>
<node CREATED="1356948450381" ID="ID_1146560104" MODIFIED="1356948462955" TEXT="create/update/delete environment variables defined at job  level"/>
</node>
</node>
<node CREATED="1356948469436" ID="ID_1232047348" MODIFIED="1356948570425" TEXT="through file system">
<node CREATED="1356948360405" ID="ID_13743797" MODIFIED="1356948395259" TEXT="create/update/delete environment variables defined at environment level"/>
<node CREATED="1356948410796" ID="ID_104867308" MODIFIED="1356948421141" TEXT="create/update/delete environment variables defined at pipeline level"/>
<node CREATED="1356948440413" ID="ID_657792482" MODIFIED="1356948449132" TEXT="create/update/delete environment variables defined at stage level"/>
<node CREATED="1356948450381" ID="ID_346883351" MODIFIED="1356948462955" TEXT="create/update/delete environment variables defined at job  level"/>
</node>
</node>
<node CREATED="1356970262814" ID="ID_452073339" MODIFIED="1357275544081" TEXT="stage rerun">
<icon BUILTIN="button_ok"/>
<node CREATED="1357404529588" ID="ID_164710305" MODIFIED="1357404555579" TEXT="stage rerun with environment change and defined env not being available"/>
</node>
<node CREATED="1356970267376" ID="ID_1563852595" MODIFIED="1357275550752" TEXT="job rerun">
<icon BUILTIN="button_ok"/>
</node>
<node CREATED="1356972428124" ID="ID_436073085" MODIFIED="1357533792803" TEXT="tasks">
<icon BUILTIN="button_ok"/>
<node CREATED="1356972435476" ID="ID_1792918079" MODIFIED="1356972445475" TEXT="custom command"/>
<node CREATED="1356972446474" ID="ID_333982083" MODIFIED="1356972452481" TEXT="ant"/>
<node CREATED="1356972453031" ID="ID_13175391" MODIFIED="1356972454632" TEXT="nant"/>
<node CREATED="1356972455263" ID="ID_627543396" MODIFIED="1356972456516" TEXT="rake"/>
<node CREATED="1356972457168" ID="ID_1257158715" MODIFIED="1356972462360" TEXT="gbt"/>
</node>
<node CREATED="1356972472813" ID="ID_95925366" MODIFIED="1357298982431" TEXT="external environment variables">
<icon BUILTIN="button_ok"/>
<node CREATED="1356972483894" ID="ID_1574128618" MODIFIED="1356972493978" TEXT="environment variables defined during startup"/>
<node CREATED="1356972494502" ID="ID_660348723" MODIFIED="1356972513008" TEXT="environment which is common to any shell that is opened"/>
</node>
</node>
<node CREATED="1356972624962" ID="ID_1786346275" MODIFIED="1356972639151" TEXT="End to End Test cases???/ Business Flow???"/>
</node>
<node CREATED="1357185904047" ID="ID_1210241370" MODIFIED="1357185907431" POSITION="left" TEXT="Questions">
<node CREATED="1357185916920" ID="ID_1880785817" MODIFIED="1357185939877" TEXT="What will happen if the environment variable value is modified by a task that got executed previously"/>
</node>
<node CREATED="1357099333122" ID="ID_630342125" MODIFIED="1357100530806" POSITION="right" TEXT="operating system">
<node CREATED="1357099353666" ID="ID_1049739579" MODIFIED="1357099356081" TEXT="windows"/>
<node CREATED="1357099356691" ID="ID_538208192" MODIFIED="1357099387423" TEXT="debian family of linux"/>
<node CREATED="1357099358658" ID="ID_1308861478" MODIFIED="1357099362001" TEXT="solaris"/>
<node CREATED="1357099362682" ID="ID_1064224635" MODIFIED="1357099379897" TEXT="redhat family of linux"/>
<node CREATED="1357099389506" ID="ID_706575904" MODIFIED="1357099393025" TEXT="macosx"/>
</node>
</node>
</map>
