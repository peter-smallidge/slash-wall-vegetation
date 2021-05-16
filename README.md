# slash-wall-vegetation
# 
# 
Analysis of 2019 Vegetation Data from the slash wall project. Back up copies of the excel files are located in the project C:\Users\pjs23\Documents\Projects\Slash Wall Research Data\Research Data\regen data

first file to run
~/R/slash-wall-vegetation/regen_and_plot_input_cleaning.Rmd
    this file outputs the following
      write_csv(tidy_regen_point, "tidy_regen_point_2019.csv")
      write_csv(plot.data, "tidy_plot_2019.csv")
    
    
The file "seedling_ht_analysis.Rmd" reads this file "tidy_seedling_heights_2017-2019.csv". The data are the heights of exposed seedlings in regen plots to assess the potential for American beech to dominate following harvest. The original file is "seedling_ht_input_format.Rmd"  An OLD file is "seedling_height_analysis.Rmd" that could be deleted or ignored.



the file "plot_basal_area_calc_summ.Rmd" is used to only provide the average basal area per acre for each of the harvest sites.  This is the output from that file
write.table(site, "site_BA_means.txt", sep="\t")
In the future this might be used to also document harvest x location.


The file "regen_and_plot_input_cleaning" works with the plot data and the regen data. The plot data are made tidy and include a categorization of the plot as stocked or unstocked based on varying levels of seedling counts per acre for commercial, diversity, and interfering species for stems 4.5 ft to 9 ft. Plus the same for these as 12" to 4.5ft. Note that type=diverse includes commercial and diversity species and should not be summed per acre and added with commercial per acre.


Three field plots in the gas line harvest were located in areas that were not
harvested. Those have been excluded from the regen and plot data in the "input" file 
using this code.
filter(!point %in% c("864", "866", "810")). These plot have been excluded from
the file "seedling_ht_analysis.Rmd" as well.

"tidy_regen_point_2019.Rmd"