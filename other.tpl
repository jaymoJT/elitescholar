 {* Logo or site title. Only use <h1> heading on the homepage.
        					   Otherwise that should go to the page title. *}
                               {if $requestedOp == 'index'}
        						<h1 class="site-name">
        					{else}
        						<div class="site-name">
        					{/if}
        					
        					
    						{capture assign="homeUrl"}
    							{url page="index" router=$smarty.const.ROUTE_PAGE}
    						{/capture}
    						{if $displayPageHeaderLogo}
    							<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo">
    								<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} class="img-responsive" >
    							</a>
    						{elseif $displayPageHeaderTitle}
    							<a href="{$homeUrl}" class="navbar-brand">{$displayPageHeaderTitle}</a>
    						{else}
    							<a href="{$homeUrl}" class="navbar-brand">
    								<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" />
    							</a>
    						{/if}
    						
    						
        					{if $requestedOp == 'index'}
        						</h1>
        					{else}
        						</div>
        					{/if}

                            <img src="https://royalliteglobal.com/public/journals/4/journalThumbnail_en_US.jpg" class="img-responsive" />