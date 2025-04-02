# slash-wall-vegetation
# 
# 
Analysis of  Vegetation Data from the slash wall project. Back up copies of the excel files are located in the project C:\Users\pjs23\Documents\Projects\Slash Wall Research Data\Research Data\regen data
1. df "summary_regen_veg_data.Rmd" reads data through the output of June 2023.  Likely through the 2022 growing season.
2. df "slash_veg_complete.Rmd" reads datafile file_path_2023_veg <- "C:\\Users\\pjs23\\Documents\\R\\slash-wall-vegetation\\summary output\\complete_full_2023(readme).xlsx".
    this, I believe include vegetation data through the 2023 growing season.  The data file here in #2 likely supersedes the df in #1
3. DF slash_veg_complete makes the data complete such that all species are included in every wall even when missing.
4. Read the code for slash_veg_complete to confirm if the spp are complete for the wall or the harvest area.
5. DF = "slash_wall_analyses_2025" is the analysis of the complete vegetation data.
6. DF = "plot_data_analysis_2025" is the file that analyzes the plot data.  It includes data from DF "plot_summary_all_years.Rmd"
7.



















(OLD README.md content)
first file to run
~/R/slash-wall-vegetation/regen_and_plot_input_cleaning.Rmd
    this file outputs the following
      write_csv(tidy_regen_point, "tidy_regen_point_2019.csv")
      write_csv(plot.data, "tidy_plot_2019.csv")
    
    
The file "seedling_ht_analysis.Rmd" reads the file "tidy_seedling_heights_2017-2019.csv". The data are the heights of exposed seedlings in regen plots to assess the potential for American beech to dominate following harvest. The original file is "seedling_ht_input_format.Rmd"  An OLD file is "seedling_height_analysis.Rmd" that could be deleted or ignored.



the file "plot_basal_area_calc_summ.Rmd" is used to only provide the average basal area per acre for each of the harvest sites.  This is the output from that file
write.table(site, "site_BA_means.txt", sep="\t")
In the future this might be used to also document harvest x location.


The file "regen_and_plot_input_cleaning" analyzes with the plot data and the regen data. The plot data are made tidy and include a categorization of the plot as stocked or unstocked based on varying levels of seedling counts per acre for commercial, diversity, and interfering species for stems 4.5 ft to 9 ft. Plus the same for these as 12" to 4.5ft. Note that type=diverse includes commercial and diversity species and should not be summed per acre and added with commercial per acre.


Three field plots in the gas line harvest were located in areas that were not
harvested. Those have been excluded from the regen and plot data in the "input" file 
using this code.
filter(!point %in% c("864", "866", "810")). These plot have been excluded from
the file "seedling_ht_analysis.Rmd" as well.

"tidy_regen_point_2019.Rmd"