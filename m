Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36854A6CD3;
	Thu, 24 Sep 2026 16:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266168; cv=fail; b=dE+WJe0buNEFj1QL44KyG091HYaEVkr7olMNmZiyhn7xyXwdiXFBqZgmQWYL6wqWehnl7duNBtBWFr/D/I1NlmopmX6f8ExZWqTsvLbXGcAkSP6Bp/R4bhhFkGJwAuAPEf9V3Sbl2bYyTHCGPL9v3uUxBGVO2JUyCSJT5DYAV9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266168; c=relaxed/simple;
	bh=FW74QTjRhWep7GgmamE9kN3ZKpQymrAxg84eqa8zftM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Zscre5gy5NoAcQ874Wvs+3T4yVCkvql2RBgtuVuYfftUFMOEQ2l0gaWyUfNi7sP1stpooMsv/phYS5sFubPPzpzll6xemdNvTk/QhMvRCxi9i4fNHXTEr2QIdFnVl8zfvGCZDJU268oWPVic3TrcLS5Vb4kz+TFPnUMRbJZn4z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LY+yNWSF; arc=fail smtp.client-ip=52.101.66.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LY+yNWSF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUiSYhCqs4zbhkVsc2bu29rRp7Mma744Uet7GLkdpF4iZt/4CbOf6AMOZjy1PiogU2ATUtMn3y4fcGMUk0EqKiPiQgtpl9Ptf39YqGBxI7X5ofGMtxcxa9+JV4A3e5zvjUx5qCipRDVSeITiR+H+YsEtLZxxFdmSigEEdqVbOnEt4VtFRRC649SKPL4RhI29pvA3q10zSz2pnrAmujIR/LoFOgWAL+dNOG9oz8C7gHwrK1S0dU0qlWL+yZ7K27VKpIRLwtTeZNRKZQPErpzJWfIwl+PSJJzn4bF7c4O3s7C3dSBq37P1PEStLsetqBFdlCdW6EBQeQD/b0j8O9aHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emIRdvzwgJkt6c7S7AYZfGQmylfHYuB4BUVINslAv0c=;
 b=L9Z0cgP/NgS8W+U9PcX3qb9R6R/CtYiu7OR7FNluEzxxdCDbu3Idd7CbD+KU7sttDKlonE6JBd7j7HNBquWVNQeRJB9eHRxg57MgAC40TcovYDGRnd1AiwXm1nPpSr1DLyP55faww11nXdIC4XjokN/EQaNkNVKWKgENHqstUH8JwA8nsm6QES9qa9vtwkhGwjPwiFKY9Clnb+xz/t1Ucwq/17jGOO6fHBjByo22bZwhWh3dNyz66pSx27LlghzN0uzpIA2NibwU3iBPv9m5FkJxRNAnfiATMVAHTcHwL8WbfnjRXJAuxbZCXKIpaCZQbG6J0aHX09VVxxNOug8h6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emIRdvzwgJkt6c7S7AYZfGQmylfHYuB4BUVINslAv0c=;
 b=LY+yNWSFkKRgBoGsXkNj2qTHWp7DsVlTHjEo22CEeACXbs95XlDxgR0ewmCMiueCsV+TV3Ua2aFnxXNtOWB18mTYxllqVs7g+7nA7R8WfCZvhX31ZLiqdM0qx00pxnIE0IvCxYACAdpasJ1ocnM4TLqQlvVjgI2Njm+gfA1u32eg8XWQAwckNw4MjCPDJrVe+kfvTWfoMY2TV0wpmKppVrmVhTlqp2Jm14eejuS1wuqky5daiBJXFTydonFToFpeHprznyKa5J5lgxrI2r+3rNzywdXP4WxkByyjydjK4FFnhlNIQJ+iUcjPGVXupANI7Yun8T8zU23UNHXz+4M44w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9648.eurprd04.prod.outlook.com (2603:10a6:10:30c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Thu, 24 Sep
 2026 16:09:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 16:09:24 +0000
Date: Thu, 24 Sep 2026 11:09:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, phone-devel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v6 22/23] dmaengine: ste_dma40: Validate fixed physical
 channel indexes
Message-ID: <arVLKUHXBoeiMYEi@SMW015318>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
 <20260924-dma40-fixes-v6-22-fdb6755020a2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-dma40-fixes-v6-22-fdb6755020a2@kernel.org>
X-ClientProxiedBy: CYZPR19CA0007.namprd19.prod.outlook.com
 (2603:10b6:930:8e::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: e972f360-bcbf-4fa8-0210-08df1a563190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|10067099003|6133799003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	8V8CdNxGoqCjXb1E93KGKyiQMNX9QydnlAzBir6BUkZ4xj7GuHw7ZbbBOF3qtaHWYG9gZ4ZLy6HMU6SqedIUcTbOz4uBgipe15Oq4q5VYQqLN9JdCeWGE/vlWPu1MA2xAHoMSaG6BsIole31+sU3ttymjHuqbJmNizdCF/D50mKlM1Ca3K5RUeeRPGnupNJT/sVdSzf+MHWMonoOgK0JglygZSNxxV13a7K2U+jhLmvUDdKaNoWoKndDsT0jAheoCzcqWuk6E8LGcZud/B+NGOD6vWn2ySnd0jXoqzXsklMU8eOzk5ieWaTzjW4zt4u58+8BLIYGxft2cQrT0AWJi/xd2OzZVleoD39cE0s/bomm8MrxAPsFk1Ptr6tycjc9UrlhQ4QJ2iwbQeRTJgvwgw+SEjYIW1CeGRtFAlJ1ifG9/OH2ZgaHHAxpeOQhprQSatOudV0zlnc1bYVvDR5By6R/HNxtvuy7hD1xs1f0ffg/4upSTkUBUYZ/jR/nnp6dUPTGowNnXew1c/rwwY20UUVtkOv+OfVhVAVBVCzW/+E7WV0GX68dOkZiZ1I0msYMzZOrrxztTp9c3RyEjwAHi3q4RdamIW/ZmfO2TjTksyFVU+XKltaup+00FP5ORHgo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x/SlPr8K5Vh/QvBmyYS6kOOqQzPoOUx0FGnZZOjMjYWMTxvbmHOqC09IXYkJ?=
 =?us-ascii?Q?vjOxk1hiQwLkuJm0GLtOx92AigLLUnJwMpUxFfyzN6Z4q1ioGsJ/4MgqN8iK?=
 =?us-ascii?Q?6/EAC2Dk4AOhnRMMn660kMr9ea7+ELM1/JPKk+kFxYUiTdsNnPtgtnIkU7/Y?=
 =?us-ascii?Q?8qVkkWhZCco/ci0uAhD4g5RimxhRJ5DyAXbrY/KbfNmWc/ZDAX6dffZhbOrh?=
 =?us-ascii?Q?6nWUmOYunNqo7o2REXkNKOGfhu64U9+BiwISYWosjkzFtBL4dcEbI/56KIzK?=
 =?us-ascii?Q?n3aeQ64l4DhymLzKC4Jfhzznmua/OrRgGM4QDO9YAY9QhJKhxtIhv0Mou2o2?=
 =?us-ascii?Q?ygWqEVudCUC+ptXqudjrnf68On0vTuqVcjmIDOe08wPu8xPOg4/sT75ETuE3?=
 =?us-ascii?Q?sP9q9M6OYkEw0cfZ3W81FrE0e/wgle7edaTeVq3ZzTd5/A6nlFkmvDBbAdGV?=
 =?us-ascii?Q?Dj8U+wzdOHDGtjlPesVXq6TLN7cUjT/Qwoupclb5Rc+dkT/ensw2PTC1TrM9?=
 =?us-ascii?Q?J9yij7e3TErnLUhjRMQXnHgc8jm2Xf0sC405JeH5S6J8Dy94Np+BapubKbjO?=
 =?us-ascii?Q?7cXFk9RoMXmRovTNG9IE8IChKNliG6154lyCBa3WGy4xqmqNDtdgwy+vdMsm?=
 =?us-ascii?Q?8R5QxXS6jUDo0+0GatzhJHbMCTmyBF8WUhspvdEkUYR5nAHtJThEHY9G4MyL?=
 =?us-ascii?Q?TdvRsHVbyX5iAkjKXGruEkO1PFm7D1moL4YzR1U4OJFVkMdXOXQOseC4dPg7?=
 =?us-ascii?Q?LfOMgEUAWeX0irgNnHrt56bOXcnDrKvBCN++5WwVTZBwEaBGZwuThVakMoUH?=
 =?us-ascii?Q?mt9BVXBDeWVx3MxkqvXKg19G5ySJnG/VIwePRc7SjSCbfV3BXBjYxIC0pXV0?=
 =?us-ascii?Q?52ZcSF+E+N+AAJ8KJLoxJVsLflbepEKVs+zkiBeVCfFsh/E7CDUUY9/vZCAe?=
 =?us-ascii?Q?emPIUeZUikWx354DJe1NgsDTpSuq0dVAagqQkL3lSpFR/VALuE90vMNcY0Sw?=
 =?us-ascii?Q?+6dIh86NjBZygf81bcm0zelVTsnOP2Q3UiPOQGm2WWnaIyKE0VaaHf8l4sLP?=
 =?us-ascii?Q?c0R3RJLJYFkCkUVik05HLUZL6xgS6kCGklkE0mphmOh5xueVe3YLUcASQ5uS?=
 =?us-ascii?Q?C1P53xEVm5BgLJGrqV99dl6EvGQ5kyOLRHhmjPj/pVXtEqntc1vo2w4orSk9?=
 =?us-ascii?Q?vLHWbgEPi7Y7yOLayCvyNM0vhFtGyT0wYpgv7R9EJc2sRTp/pXS8nmVcz4gq?=
 =?us-ascii?Q?aI5RPEPm5oOSh8HpKX1bdTkXgQ3nKAnhNK/YUM1/tXFO8f6QG1X6DxRGfzLR?=
 =?us-ascii?Q?qtmtRAVWci7k9tpnGAT/lYGi0mvJwyQm07qNBWdi68QobaYKIo7shQY+DtS9?=
 =?us-ascii?Q?La7h/gFZvRDSGnW/PsHSn+bcKLAbjdHv1gJgjROIqzeMPYo5jZqfcpNOnl5F?=
 =?us-ascii?Q?zEIH4otJsyORjCGsCTZUbnWd9pJn5SBGr5jn5ZLIDyvrJuGDq5hnjvof9Use?=
 =?us-ascii?Q?DUooHMaCzmobuQNnJmkV77AnybSz2gs4KgtzU/teXtGDfQ3wmNav6a3V2q35?=
 =?us-ascii?Q?6Pf/LjKqwk/A81Iwn5bkeu4LzMN6Wew6ovGeigoz0isUCG+gykhsm95MIxiy?=
 =?us-ascii?Q?fu3RUZjpLGYNsEvrVtBRhphyY+3rifTFJsB0lD9pe5eqTTkSCLoszHTwBNSw?=
 =?us-ascii?Q?OZZWMfYi8SpHiN/iL4jMswePQR7f8lsYNtEEqn2bvdfyjYurrX8yq6hvQ3Nt?=
 =?us-ascii?Q?rW6ncWFnLlGIRep2InjpHNXXO8IEnGcwclCx+YITJ2zOVJWKfoed?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e972f360-bcbf-4fa8-0210-08df1a563190
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 16:09:23.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPrZ92zlK32ENLkwcKYCadEuV75o/nYHjR5tQrtKnpTSY1rGxxEo8Os1aClP/nu4dsd50yaiR5/zYmK8lqPii9AiowDMM+l4KDNCvnO60FMsJcX8YlaB9BOSlKe+xmKY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9648

On Thu, Sep 24, 2026 at 10:35:34AM +0200, Linus Walleij wrote:
> Fixed physical memcpy allocation uses dma_cfg.phy_channel directly as an
> index into phy_res when use_fixed_channel is set. d40_validate_conf()
> validates dev_type but not the fixed physical channel, allowing an invalid
> configuration to access memory outside the array.
>
> Validate the fixed physical channel centrally before accepting the channel
> configuration.
>
> Fixes: f000df8c5a0e ("dmaengine: ste_dma40: support fixed physical channel allocation")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ste_dma40.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index def2416fb1d0..d65bf6cfea53 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -1918,6 +1918,14 @@ static int d40_validate_conf(struct d40_chan *d40c,
>  		res = -EINVAL;
>  	}
>
> +	if (conf->use_fixed_channel &&
> +	    (conf->phy_channel < 0 ||
> +	     conf->phy_channel >= d40c->base->num_phy_chans)) {
> +		chan_err(d40c, "Invalid physical channel (%d)\n",
> +			 conf->phy_channel);
> +		res = -EINVAL;
> +	}
> +
>  	if (conf->dir == DMA_DEV_TO_DEV) {
>  		/*
>  		 * DMAC HW supports it. Will be added to this driver,
>
> --
> 2.55.0
>
