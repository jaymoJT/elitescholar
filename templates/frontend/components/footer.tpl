{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2023 Simon Fraser University Library
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

	</main>

	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
	
		{if $sidebarCode}
			<aside id="sidebar" class="pkp_structure_sidebar left col-md-3" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
				{$sidebarCode}
			</aside><!-- pkp_sidebar.left -->
		{/if}
	{/if}
	</div>
	</div><!-- pkp_structure_content -->
	
	<footer class="footer" role="contentinfo">





	<div class="pre-footer">
       <div class="container">
            <div class="row">
                <div class="col-md-3 column-separator">
                    <h4>Mobile Friendly</h4>
                    <p class="footer-p">Our system is responsive to enable easy reading from any device.</p>
                </div>
                <div class="col-md-3 column-separator"> 
                    <h4>Rigorous Peer Process</h4>
                    <p class="footer-p">We ensure the research we publish is of the highest quality.</p>
                </div>
                <div class="col-md-3 column-separator"> 
                    <h4>Fast Publishing</h4>
                    <p class="footer-p">Your research will be available to the scientific community as soon as possible.</p>
                </div>
                <div class="col-md-3 column-separator">
                    <h4>Open Access</h4>
                    <p class="footer-p">We offer open access so your research can be freely accessed by all readers.</p>
                </div>
            </div>
        </div>
    </div>
    <hr>




		<div class="container">
			<div class="row">
				{if $pageFooter}
				<div class="col-md-10">
					{$pageFooter}
				</div>
				{/if}
				
				
			</div> <!-- .row -->
		</div><!-- .container -->
	</footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>