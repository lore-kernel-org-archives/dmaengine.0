Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02534EB843;
	Mon, 28 Sep 2026 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614893; cv=fail; b=K22GH0+B5y/aTwm1wW6prQF67kuFtGbTROL/4TZL/asxksD6hkH3VyF9dRU52B9rGwT/RW3h9fHscaV5FArSIj+eZKiTnchVvNGNUoyeiS64zPlxyV6QpTO/7r6xXzZIehA380jj9VSkWxPoU0rm/9GSpQ7qs0KBmt1CSaXudFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614893; c=relaxed/simple;
	bh=EcH1DllTRix4ewoZaCmFR9dbXmN8yKgYUkhLhA7LR4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=knLfD+9ogQu5NEirBn5F1sez9px4L9tmHFFPh8lMIxCi9XJrc6QMy8vn9zwQFm99oQ+OrjdWFNFhgTPpBhsx4gvSqBUwn3ktByXgQxwtWXRMJ3XQZCIAQnyhgKXa3K+xR3ZdFf+yq/oKP95j5jnVHmYJdj0hHh5Grk+H+LLL1Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ppZkap5A; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ppZkap5A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/U8pKINffjGcFQtB91AyT9NmQ1Vxffyfrf8E2GXmzaQCccDaFExMWCzbN/4uLb6/dAtG96N/xvE+l7WdKB4Ci362rvj2dcpTlZxREya5MW0VMv4yp0+YTLFRNPaqrs1uzE2qpC/0ESyjMJnLIVtl3wkkeUk8spkhY4s5KsaS4keRdTCRj6c+iDafkefOqXrdlD1CyvBcIVBqb1Q58UO2CPpB9zfb5j3EzDlPR96qKN3WsPa39NVQGyFhc1QyHV5c1YzpNO3JqlRDTH/SKN/t+zj+W2azaAzTu05XxX+lK7+7HqOaNn8NxUe4uy4+H1v5JO37Wgu2RJ4I/Rirrlzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSu/6pFxHI6t2YamAJkzp1BsnxFRQNW3t/LfoE3EMfs=;
 b=wXZIOFdWuIiclTP69i0TTGFJ/CCEowTzf9IAa4Zri8Swwg89X6ajSdWW5d222XHw4GMOOz+7Wx6AU19msjsEAf5y5mhQXUuaLP5qeu3BLwn5043CsTANxrfm5bw1Lid5debufbY3TBlKU0V3/V8fZtpMUVZS/63d2CxdWtn+gDp/Ze18LFENc+cjNLmbZZe9k30z7mTyaQ1q50++KeMthjMC7LbL2INKCPdvs3/2Bu3Ju8radTPk+FE34b3/g2TahIGHU1VGcAFWd5p+iB17Zt8Nlje6dr7bYERL5nsFsZTs5+tPNgFLjYgVwH9rbW2CrMjzpJHG1lPJQxTQLCPaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSu/6pFxHI6t2YamAJkzp1BsnxFRQNW3t/LfoE3EMfs=;
 b=ppZkap5AcP2cgx5tZ+iae2KGfWM2MZq2UfdQxvymzIJWXId4F7SX7YgNQ2wUsrDZ9qkj7+WSpswNSuvqKM16v+XZua5AdrpwnTnqZjvKb9NuxTVcPoZ2q224dTEUO5tCULSc71hsH7twbv46ZJy55jSPlbftWQgv8MQgy4xjbgcOZzmGWl965ieZFA+udgK9PbuXySZ8i+XvnT4voBidnwKkn61GVYzdjCilnLj8Zzq3rLAdvCb/dyjwPoNPfDOGxwUfaoyT7BbvlVjqbkQZgzpzYCtN0QHj5eIdvPJP3mwZGXfsEa3qMS8ipIhkmpOo0tlryg7AU//lmYaXYilXPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8764.eurprd04.prod.outlook.com (2603:10a6:20b:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 17:01:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:01:05 +0000
Date: Mon, 28 Sep 2026 12:00:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v7 20/24] dmaengine: ste_dma40: Fix event group bounds
Message-ID: <arqdSEVF8taOl5GS@SMW015318>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
 <20260927-dma40-fixes-v7-20-89f595e8851d@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-dma40-fixes-v7-20-89f595e8851d@kernel.org>
X-ClientProxiedBy: CYZPR17CA0003.namprd17.prod.outlook.com
 (2603:10b6:930:8c::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db69ba9-8c52-45ef-992a-08df1d821558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	W6ylwvD3ryuWhyHJWPlpDm5574wbnoIk9GzxLhxfIZsh5Me78T6AY1Ateru8XijkB0IxZJkfwGhsVFk8ZY47BDUQTZiqFjyoCGaf0215Z2cTFR2QBf1l6X25T+MVfeMNJS39Ff8ZVAu4op710LSm/WiCwwihJJiyT8jRUb0AnnRQ5nkBFHLTCVyJnAgcm+vieamXQaod3TSikget+Q7Tf67N5zAHhtMI+MKS9VWB4oV76AIbD9P9QVU2yBlePUe9jaYGI8uPR9KrJMn74ZWufGzn3rPxBxNqwd7PjPK6khxxYCgxhP1akBg3AC96TLNmv9dOWD2C4aAE4ndUQ4WXQaYipf76yKQ/1w5qk8IHbM+dWgAM9gRu3aQdPgC1/0bVQmVzIRdz5T1Fbcxi7ZqseJkiG5FYeRhnp688W1N4Fv8q9GUmwIs8Kj9cAYjd4v+B1UzdiZKNmBc7nU2mCIrjbN7t8XLb7+7i67D31pEFC9EoxbJqvXjmVXwbSth6rEzcofwQlB6Z6V5oPUW+wjvE7FAIJ4Kl5GEBivGiHQC5MhYTQ/CNfVBIabvYcjucjtxHaDv3xekdZGyQUQPAEwr65KJOeN3NP4oKkrjoeFbjTzE/FkC/8gjq8bCqLp860TrT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VjtSzt9dWVptTWijmXt122h3ZvZvT/SGnPB8rCvQALIektCrnJGzSBagM2PP?=
 =?us-ascii?Q?QkbpsVmvouLWG2fk1STd91DWJ2Ce6bpyS6hSRjW7rwTCmQQzFBptTZ0dnCLc?=
 =?us-ascii?Q?RL0hUbFvqAPrDkJ2JxLgGEayTJ4GWbWmcEmUsa5jG33Bi4NK+K5RHwAVm9eN?=
 =?us-ascii?Q?WEjBr9sExwV8MbFEITsgNatO8OZw+YDzV3oe3cgj+0vcz60XiUA2+8djMHMh?=
 =?us-ascii?Q?ncl5KMBsYPo2KBeVelMy5oJRHI8QGmtsX2YSVywpAA7h2MW23FkKdn8B4x+W?=
 =?us-ascii?Q?msRXmyMQiGIAf9wzMUBjwDrjv2rv+pbJdMREAz8POTg7itx8Ej2fSOHsjBNU?=
 =?us-ascii?Q?VG4Qw+v/BKkN3J4EJ9bCFuoJZjMPFA/K5JbP0FXaENljkqQHpIK1ivq6dezg?=
 =?us-ascii?Q?/KIpplBjhIHK8m1QC2Pwm1mYVOMsiEpAC9vwJPbDPmgr+I83qPsRll3Xjr0A?=
 =?us-ascii?Q?dFWqSyackhjQVy2E5c5/zJfApGjfySFVYVNYvSkTkcvmjE3wnH4bcinYmxOP?=
 =?us-ascii?Q?gk7uyLHwMkJw5A7HSHZjxojLMC7/5F8l1VVcXyl2nkfTAj0zyhtglNffMtKb?=
 =?us-ascii?Q?DOBZnW+K+Ua3Cguky8vBAytSsVbD/ky1aFKwuhMSNAntlUi8eyJVoeVUi1qJ?=
 =?us-ascii?Q?YdX/HkNtFdeQG3dBtPgmD2gfOzkEABzCkCcffilRbjBhNOkE9MyA02gXOpRL?=
 =?us-ascii?Q?qJWnTecDEn0S2sUCV6pcz0emWpaVvP+3DDzXugpbifQ8gpfLiFPox5c7J3lM?=
 =?us-ascii?Q?gsWfJOiVQh5ZOMEQlqK4Eib/hntKH0OAoDxA/d+QHZL1BoJ8R93CFNAeucj/?=
 =?us-ascii?Q?sLeLPud590N3Aim/sW97B3/k6SezWikrcwnr+bC+P9GKdZm+B6NESZJPBV3v?=
 =?us-ascii?Q?GymjIXIhJSdtOX0wEOTa/jgt0182jyPyCofQ+IW8VKzAmeqd8uWWzB7/ZGPm?=
 =?us-ascii?Q?vUI32h1mT2LZLya271kvAoJrfLag1/enfuyXs/dIubGdWiu8MOgSkUB8nZbW?=
 =?us-ascii?Q?G/KcwMBi5tAoS7XlafLbLWzEmwwAoB1BZKPdkRAYIUBr+Xe7XmSfqEkYpwVC?=
 =?us-ascii?Q?EoUDiYuSEmNLn3qqd1O0JgX9/M5UjaLg3Gr/pX+6fxme8TFEV7I1r+6fXc++?=
 =?us-ascii?Q?/zpH3EEkGuKIQUT0Fqm4KX4sU/nY1Mb00/v1yAsarhvoI/frxgoo7KqaHU9F?=
 =?us-ascii?Q?j+wciS2aUnx9Se30tTPvnFj2je2HW878PsU/tRa0JRcVA4KfiI+OiCO5gZSY?=
 =?us-ascii?Q?hKVykVgZu+k4qfu2QTSmRx5iw8eNRiri7bokjmYP0uE0uOq6X7XuyNqjKvJo?=
 =?us-ascii?Q?JFpx3mihaax01sH0fI5N/rFIks1Ciqjc7c8a5LaryBP5N5H48cLYijUO/nxi?=
 =?us-ascii?Q?pDHaVyg2LGTV5AxUQA5tC9gWJV6xRBLNe80ZfteCH0/9A+h+55OuQoen0kAE?=
 =?us-ascii?Q?wrd3/Rh5OmLYlqq1GrW3c1xMPHtKcJjWvn6CJTAjbp/0UmQVU1qaFDs0M6d8?=
 =?us-ascii?Q?fZHY+nKQovN3XwA/f1ru5h49W6xdB10PRm4WVSPo4XZ+nQXdIKUyk5Ln09/d?=
 =?us-ascii?Q?Cu1R6VVz83+PDcqRP1TMpv8GmgywM6tcBUSCcRli4JdlBi3G8bfoDNtlOC2U?=
 =?us-ascii?Q?WRzid2UeOb1EbOaxp04LoKPpvj+x/9x8SRz8m4fbXm4yfKW1PfcvcVoVekMZ?=
 =?us-ascii?Q?2Dj1KjVRnqZORMoYnMIdu8uMsJwrquPKbJ08p7br0PNAyv/yYfb/AsZu6+d8?=
 =?us-ascii?Q?l67ay5OGhqz15BdjcQ3D/pdYtJCJjSIbER5DbDvc/SdVLRt4y/ls?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db69ba9-8c52-45ef-992a-08df1d821558
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:01:05.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EENv+55EDsVBi/7JvjkprL54lGqWTShK+WNH1oqS5Z3uU+xGvMGJwqDGktDkb0Th6I3cBD0RA7PdeXy6pBzs9lLloCEI4l1rXjFmdU3Turn3G9sJY2OiWZ64JlUCIrF0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8764

On Sun, Sep 27, 2026 at 11:03:33AM +0200, Linus Walleij wrote:
> The dev_type validation can allow values whose derived event group has no
> matching physical channel pair. d40_allocate_channel() then indexes
> phy_res with j + event_group * 2, and __d40_set_prio_rt() uses the same
> group to select priority and realtime registers.
>
> The physical-mode validation also compares dev_type with the number of
> physical channels. However, dev_type identifies an event line: DB8500 has
> eight physical channels but 64 source and 64 destination event lines. The
> event group determines which physical channel pair can serve an event, so
> the physical channel count is not a valid dev_type limit.
>
> Reject dev_type values outside the hardware event-group range, remove the
> incorrect physical channel count limit, and stop the physical-channel
> search before a partial final channel group can index past phy_res.
>
> Fixes: 26955c07dcf3 ("dmaengine: ste_dma40: Amalgamate DMA source and destination channel numbers")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Link: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/dma/ste_dma40.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index fcb074928675..91dc143f9a80 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -82,6 +82,10 @@ struct stedma40_platform_data {
>  #define D40_LCLA_LINK_PER_EVENT_GRP 128
>  #define D40_LCLA_END D40_LCLA_LINK_PER_EVENT_GRP
>
> +/* Number of event groups per hardware register layout */
> +#define D40_EVENT_GROUPS_V4A 4
> +#define D40_EVENT_GROUPS_V4B 5
> +
>  /* Max number of logical channels per physical channel */
>  #define D40_MAX_LOG_CHAN_PER_PHY 32
>
> @@ -522,6 +526,7 @@ struct d40_chan {
>   * @high_prio_clear: the high priority clear register
>   * @interrupt_en: the interrupt enable register
>   * @interrupt_clear: the interrupt clear register
> + * @num_event_groups: number of supported event groups
>   * @il: the pointer to struct d40_interrupt_lookup
>   * @il_size: the size of d40_interrupt_lookup array
>   * @init_reg: the pointer to the struct d40_reg_val
> @@ -536,6 +541,7 @@ struct d40_gen_dmac {
>  	u32				 high_prio_clear;
>  	u32				 interrupt_en;
>  	u32				 interrupt_clear;
> +	u32				 num_event_groups;
>  	struct d40_interrupt_lookup	*il;
>  	u32				 il_size;
>  	struct d40_reg_val		*init_reg;
> @@ -1883,6 +1889,11 @@ static int d40_validate_conf(struct d40_chan *d40c,
>  	bool is_log = conf->mode == STEDMA40_MODE_LOGICAL;
>  	bool invalid_dev_type = conf->dev_type < 0;
>
> +	if (!invalid_dev_type &&
> +	    D40_TYPE_TO_GROUP(conf->dev_type) >=
> +	    d40c->base->gen_dmac.num_event_groups)
> +		invalid_dev_type = true;
> +
>  	if (!conf->dir) {
>  		chan_err(d40c, "Invalid direction.\n");
>  		res = -EINVAL;
> @@ -1899,8 +1910,7 @@ static int d40_validate_conf(struct d40_chan *d40c,
>  		invalid_dev_type = conf->dev_type >= max_dev_type;
>  	}
>
> -	if (invalid_dev_type ||
> -	    (!is_log && conf->dev_type > d40c->base->num_phy_chans)) {
> +	if (invalid_dev_type) {
>  		chan_err(d40c, "Invalid device type (%d)\n", conf->dev_type);
>  		res = -EINVAL;
>  	}
> @@ -2065,8 +2075,12 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  				}
>  			}
>  		} else
> -			for (j = 0; j < d40c->base->num_phy_chans; j += 8) {
> +			for (j = 0; j < d40c->base->num_phy_chans;
> +			     j += D40_GROUP_SIZE) {
>  				int phy_num = j  + event_group * 2;
> +				if (phy_num + 1 >= num_phy_chans)
> +					break;
> +
>  				for (i = phy_num; i < phy_num + 2; i++) {
>  					if (d40_alloc_mask_set(&phys[i],
>  							       is_src,
> @@ -2086,8 +2100,10 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
>  		return -EINVAL;
>
>  	/* Find logical channel */
> -	for (j = 0; j < d40c->base->num_phy_chans; j += 8) {
> +	for (j = 0; j < d40c->base->num_phy_chans; j += D40_GROUP_SIZE) {
>  		int phy_num = j + event_group * 2;
> +		if (phy_num + 1 >= num_phy_chans)
> +			break;
>
>  		if (d40c->dma_cfg.use_fixed_channel) {
>  			i = d40c->dma_cfg.phy_channel;
> @@ -3467,6 +3483,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
>  	base->log_chans = &base->phy_chans[num_phy_chans];
>
>  	if (base->plat_data->num_of_phy_chans == 14) {
> +		base->gen_dmac.num_event_groups = D40_EVENT_GROUPS_V4B;
>  		base->gen_dmac.backup = d40_backup_regs_v4b;
>  		base->gen_dmac.backup_size = BACKUP_REGS_SZ_V4B;
>  		base->gen_dmac.interrupt_en = D40_DREG_CPCMIS;
> @@ -3480,6 +3497,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
>  		base->gen_dmac.init_reg = dma_init_reg_v4b;
>  		base->gen_dmac.init_reg_size = ARRAY_SIZE(dma_init_reg_v4b);
>  	} else {
> +		base->gen_dmac.num_event_groups = D40_EVENT_GROUPS_V4A;
>  		if (base->rev >= 3) {
>  			base->gen_dmac.backup = d40_backup_regs_v4a;
>  			base->gen_dmac.backup_size = BACKUP_REGS_SZ_V4A;
>
> --
> 2.55.0
>
