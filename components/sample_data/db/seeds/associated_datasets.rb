workspace_fidelity = Workspace.find_by_name("Fidelity")
workspace_hyundai = Workspace.find_by_name("Hyundai Kia CS")
workspace_mfg_labs = Workspace.find_by_name("MFG Labs - DSP")
workspace_analytics_labs = Workspace.find_by_name("Analytics Labs")
workspace_discovery_providers = Workspace.find_by_name("Discovery Providers")

adwc_fidelity_dataset = Dataset.find_by_name("adwc_fidelity")
adwc_fidelity_engagement_score_dataset = Dataset.find_by_name("adwc_fidelity_engagement_score")
adwa_benchmark_dataset = Dataset.find_by_name("adwa_benchmark")
adwv_kia_dash_dataset = Dataset.find_by_name("adwv_kia_dash")
adwv_ac_dsp_dataset = Dataset.find_by_name("adwv_ac_dsp")
adwa_data_exploration_dataset = Dataset.find_by_name("adwa_data_exploration")
adwf_3pas_activity_dataset = Dataset.find_by_name("adwf_3pas_activity")
adwf_activity_dataset = Dataset.find_by_name("adwf_activity")
adwf_imp_click_dataset = Dataset.find_by_name("adwf_imp_click")
adwf_impression_dataset = Dataset.find_by_name("adwf_impression")
adwd_agency_dataset = Dataset.find_by_name("adwd_agency")

AssociatedDataset.create([
                           {:dataset =>  adwc_fidelity_dataset, :workspace => workspace_fidelity, :created_at => "2014-03-18 19:21:49", :updated_at => "2014-03-18 19:21:49", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwc_fidelity_engagement_score_dataset, :workspace => workspace_fidelity, :created_at => "2014-03-18 19:21:49", :updated_at => "2014-03-18 19:21:49", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwa_benchmark_dataset, :workspace => workspace_fidelity, :created_at => "2014-03-18 20:08:29", :updated_at => "2014-03-18 20:08:29", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwv_kia_dash_dataset, :workspace => workspace_hyundai, :created_at => "2014-03-18 21:51:38", :updated_at => "2014-03-18 21:51:38", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwv_ac_dsp_dataset, :workspace => workspace_mfg_labs, :created_at => "2014-05-01 18:33:14", :updated_at => "2014-05-01 18:33:14", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwa_data_exploration_dataset, :workspace => workspace_analytics_labs, :created_at => "2014-09-17 13:03:07", :updated_at => "2014-09-17 13:03:07", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwf_3pas_activity_dataset, :workspace => workspace_analytics_labs, :created_at => "2014-10-01 15:03:53", :updated_at => "2014-10-01 15:03:53", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwf_activity_dataset, :workspace => workspace_analytics_labs, :created_at => "2014-10-01 15:03:53", :updated_at => "2014-10-01 15:03:53", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwf_imp_click_dataset, :workspace => workspace_analytics_labs, :created_at => "2014-10-01 15:03:53", :updated_at => "2014-10-01 15:03:53", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwf_impression_dataset, :workspace => workspace_analytics_labs, :created_at => "2014-10-01 15:03:53", :updated_at => "2014-10-01 15:03:53", :legacy_id => nil, :deleted_at => nil},
                           {:dataset => adwd_agency_dataset, :workspace => workspace_discovery_providers, :created_at => "2014-11-06 10:39:52", :updated_at => "2014-11-06 10:39:52", :legacy_id => nil, :deleted_at => nil}
                         ])