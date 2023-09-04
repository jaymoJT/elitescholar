{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * UPDATED/CHANGED/MODIFIED: Marc Behiels - marc@elemental.ca - 250416
 *
 * Copyright (c) 2014-2023 Simon Fraser University Library
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
 
 
 
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}



<div id="main-content" class="page_index_journal">
    <div class="row">
            <div class="col-md-4 column-separator">
                
                <h2 class="title">Current Issue</h2>
                {include file="frontend/components/breadcrumbs_issue.tpl" currentTitle=$issueIdentification}
               
                {assign var="issueDetailsCol" value="12"}

        		{* Issue cover image and description*}
        		{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
        		{if $issueCover}
        			{assign var="issueDetailsCol" value="8"}
        			<div class="thumbnail">
        				<a class="cover" href="{url|escape op="view" page="issue" path=$issue->getBestIssueId()}">
        					<img class="img-responsive" src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
        				</a>
        			</div>
        		{/if}
        		
        		
        		{* Published date *}
    			{if $issue->getDatePublished()}
    				<p class="published">
    					<strong>
    						{translate key="submissions.published"}:
    					</strong>
    					{$issue->getDatePublished()|escape|date_format:$dateFormatShort}
    				</p>
    			{/if}
    			
    			
                
            
            </div>
            <div class="col-md-8">
                {call_hook name="Templates::Index::journal"}
            
            	{if $homepageImage}
            		<div class="homepage-image">
            			<img class="img-responsive" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
            			
            			{if $journalDescription}
            			<div class="overlay-text">
            			    <h3>About the Journal</h3>
        		                {$journalDescription|truncate:300:"..."}
            			</div>
            			{/if}
            			
            		</div>
            	{/if}
            </div>
        </div>
    
        <div class="container-fluid">
            <hr>
            <div class="Announcements">
            {* Announcements *}
            	{if $numAnnouncementsHomepage && $announcements|count}
            		<h2 class="title">{translate key="announcement.announcements"}</h2>
    		        <div class="content">
    		            {foreach name=announcements from=$announcements item=announcement}
    					{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
    						{break}
    					{/if}
    					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
    				    {/foreach}
    		        </div>
            	{/if}
            </div>
            <hr>
            
            <div class="current_issue">
            {* Latest issue *}
            	{if $issue}
            		<section class=" current_issue">
            			
            			<div class="block_content_wrapper">
            			    <h2>{translate key="journal.currentIssue"}</h2>
            			    <p class="current_issue_title lead">
            				{$issue->getIssueIdentification()|strip_unsafe_html}
            			</p>
            			{include file="frontend/objects/issue_toc.tpl"}
            			<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="btn btn-primary read-more">
            				{translate key="journal.viewAllIssues"}
            				<span class="glyphicon glyphicon-chevron-right"></span>
            			</a>
            			</div>
            			
            		</section>
            	{/if}
            </div>
            
            {* Additional Homepage Content *}
        	{if $additionalHomeContent}
        		<section class="additional_content">
        			{$additionalHomeContent}
        		</section>
        	{/if}
            
        </div>
    
    
    
    
    
    


    
	


</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
