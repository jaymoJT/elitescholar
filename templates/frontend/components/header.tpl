{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University Library
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
	{assign var="showingLogo" value=false}
{/if}


<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">
	<div class="pkp_structure_page">
	    <div class="top-bar">
		    <div class="container-fluid">
			   <div class="row">
			        <div class="col-xs-7">
					    <div class="top-bar-link">
						    <a href="#" class="title-link"><span class="glyphicon glyphicon-home"> Home</span></a> &nbsp; &nbsp;
							<a href="#" class="title-link"><span class="glyphicon glyphicon-envelope"> Contact</span></a> 
						</div>
					</div>
					<div class="col-xs-5">
					    {load_menu name="user" id="navigationUser" ulClass="nav nav-pills tab-list pull-right"}
					</div>
			   </div>
			</div>
		</div>

		<nav id="accessibility-nav" class="sr-only" role="navigation" aria-label="{translate|escape key="plugins.themes.royalboots.accessible_menu.label"}">
			<ul>
			  <li><a href="#main-navigation">{translate|escape key="plugins.themes.elitescholar.accessible_menu.main_navigation"}</a></li>
			  <li><a href="#main-content">{translate|escape key="plugins.themes.elitescholar.accessible_menu.main_content"}</a></li>
			  <li><a href="#sidebar">{translate|escape key="plugins.themes.elitescholar.accessible_menu.sidebar"}</a></li>
			</ul>
		</nav>

		{* Header *}
		<header class="navbar navbar-default" id="headerNavigationContainer" role="banner">
			
			{* User profile, login, etc, navigation menu*}
			
			<div class="container-fluid header-banner">


			                {capture assign="homeUrl"}
				                {url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
    						{/capture}
    						{if $displayPageHeaderLogo}

								<div class="block_content_wrapper">
									
									<div class="row">
										<div class="col-md-6">
											<div class="nav-image">
												<a href="{$homeUrl}">
													<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} class="img-responsive" >
												</a>
											</div>
										</div>
										<div class="col-md-6">
										    <div class=" text-center ">
                                                 {* Search form *}
                            						{if $currentContext}
                            							{include file="frontend/components/searchForm_simple.tpl"}
                            					    {/if}
                                            </div>
										   
										</div>
									</div>
				                </div>
    						{elseif $displayPageHeaderTitle}
    							<div class="block_content_wrapper">
									<div class="row">
										<div class="col-md-6">
											<div class="journal-title py-5">
											    <h1><a href="{$homeUrl}" class="title-link"> {$displayPageHeaderTitle}</a></h1> 
										    </div>
										</div>
										<div class="col-md-6">
											<div class="journal-title py-5">
											    
											</div>
										</div>
									</div>
				                </div>
    						{else}

								<div class="block_content_wrapper">
									<div class="row">
										<div class="col-xs-4">
											<div class="nav-image">
											    <a href="{$homeUrl}">
											        <img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" />
										        </a>
											</div>
										</div>
										<div class="col-xs-8">
											<div class="journal-title py-5">
											    
											</div>
										</div>
									</div>
				                </div>


    							
    						{/if}
    						
    						
        					{if $requestedOp == 'index'}
        						</h1>
        					{else}
        						</div>
        					{/if}

			    

			    
			</div>
            
            <div class="primary-menu container-fluid">
				<div class="navbar-header">
					{* Mobile hamburger menu *}
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-menu" aria-expanded="false" aria-controls="nav-menu">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>

				{* Primary site navigation *}
				{capture assign="primaryMenu"}
					{load_menu name="primary" id="main-navigation" ulClass="nav navbar-nav"}
				{/capture}

				{if !empty(trim($primaryMenu)) || $currentContext}
					<nav id="nav-menu" class="navbar-collapse collapse" aria-label="{translate|escape key="common.navigation.site"}">
						{* Primary navigation menu for current application *}
						{$primaryMenu}

						
					</nav>
				{/if}
        
        	</div><!-- .pkp_head_wrapper -->
			
		</header><!-- .pkp_structure_head -->

		{* Wrapper for page content and sidebars *}
		<div class="pkp_structure_content container-fluid">
		    <div class="row">
			<main class="pkp_structure_main col-md-9 column-separator" role="main">

