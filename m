Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E0649EC52;
	Tue,  1 Sep 2026 18:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288829; cv=fail; b=ecHyhJ4QiJ5mmeZXeO8eIptJDa8GxWISTmefk4+QrbBb0ql5zutkP5lwA3wPUext9c7Z86CJs6Br95MPCl3h+mAOwk4A5BObNeqXSKu7Ad8LfBRqizBPku7U8cG3/jZZGjpU/CspZT3utKyKJ8vjTYN9xh2EhEMKOSgeHirJ2WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288829; c=relaxed/simple;
	bh=xZIiMfF2gGeWqxzutSRln8xtpzPWCDgdTqIAHJHz6CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pHOe2GEFy5d6GI87WRSueqdScNHM2QOfkaDSKqQrVug3DwGwE/NmJUsn7kYnd4+PlnQ3I+JhQK8X87Cn0fMOOxgdTUZLoLc7zRpdBvivB0RhH3zVAFFV17Tzm9f2wJ8fbeAjXqHRGO5Ogc25uktP8k7yEJAuY/lrA68Y0DjT+cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q5LKFUfG; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q5LKFUfG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkHX9yIDYSZUNNSMoTRVI0ShYarWNPrrtI96t51OeFGTt37ZDu492j3TFK9qreOak+RFe/8yxIi9XI+nrUtVJQ7hp+uP10oug/tSyVNkH/+wwOpdCM07DYFAKMKyvoWn5KJzM6C8wOdahfTNSi9hgRajbZhMQZYLAihIl+ZOpy+P62h9nw/wzB/UqZP6Bl8bqKtfLdZbG6SqYLDHkIWtJg1DBfgPb1nr6WTvmeT6NmoiyTBtchJYxcHDiEtl3JX7rE76JFHNFFDmPKwdmaL4vqLVwoyx8AFYbvc5JkqeU4Oe8OnS/kwRWnQpCo4LYjG+f3AfF2EDKfJ6CJmHZW30Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eDwkfv2QkqU4TCmq4zsDOMIZhuNAQAqDYRONRvLGHc=;
 b=embbuFItQWIaG9pdxTny56fQUSzwQImYyD+90UGlKiwe+rFBz6j5c3TgAvrEuIigwRQsWVyDMNpJ+BxVNHm4rF22Y4Ta0e4zGHCEqLk/eAHhyGZMOODR4V2CK8giXQPbs/0W7o7r/p7lYVmRSd7It0TNzRocFiCscnlJEUtgKWL8vlRXqQyN3l+O+QVzzHXReQTuErAADbIhF9fqa/2e+5Ea57/n9/NK9gTXX+SjSU/cRB2KhjPYpuSgwPKQIHtHKWnvQ09R+ZiU70dtQcomdtcguwrrsgub4TPWfmGHR4eeB1e455nWhWLg/GlfjVeC13R9Kmqmilvatj5Z1UkE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eDwkfv2QkqU4TCmq4zsDOMIZhuNAQAqDYRONRvLGHc=;
 b=q5LKFUfGslPneBCnQlZDkF9Yi5ayEJlSW6qoaeCWingDO9L3DJUltEjUruT0Vl/3wqf38STVwmgMjHXXlNqZYNgKzHrtgZgK7xmGlo/+vpykVkzdmM4R0q4Bs0DJUgfq/4xYilTpatU0E4xiZAJvb/upiA9HYDQ1W4VyQb25JRlFgpTH6s930CYL8iGRkBF1XgoSh9VigiLzlC9yHRt2gLk0Fmo6BWTxYGcSP1w3pNAwd3TRw0Velh7IMOAj8UeQyfC2BIDj+QPV8Mp8VpYgwJbl7RUUKl785DqOSK52q1ao3dlbWCfsBYlopgsW3t0+YUZnrLB9a3S+Be1V4IXAfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 18:53:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 18:53:42 +0000
Date: Tue, 1 Sep 2026 13:53:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Pandith N <pandith.n@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sia Jee Heng <jee.heng.sia@intel.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dmaengine: dw-axi-dmac: Fix LLI dump
 out-of-bounds access
Message-ID: <apcfLFBPYOK8QT-O@SMW015318>
References: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
 <20260901-dma-fix-v2-2-d7f0459ebb14@ultrarisc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-dma-fix-v2-2-d7f0459ebb14@ultrarisc.com>
X-ClientProxiedBy: PH8PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:510:23c::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: fb45d54c-c7fd-48e4-b788-08df085a5771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|10067099003|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	5XKJ12SPkTopBc/aassmhAjPeCCWm7CRfvrAkrNRfpMeMCUDrwpbSwj4GzP3lPsq0GfQlIiAnQHFWIf2b57k5ZiySDYNgAQuQo8oFGBkykCu/rxbvq5Xp6asFU1LmmrZGNdpXV8B82ubSdZOLTC6WjeAgCkLCajovyxHq70xm9q97AIFQwubeQtbBbevUX3hsCtY6xf922ATh+dwj2UyMoo3vja24rav7PQkKycLZ1J0UN5qS2YYTgDTB8uByeK7y+5PVtPUr8VQT47GY+9S/LzDIthUZKTRpCgEsUtUQ9JqJ0Hd+IRwMnZ/cvyr7qNbH6HVNS8Ql7u7g729NLSJZKglGdHrplSbIMyvA/OZUzPUWBta18Fi46doi50QPJOaMEFRehAzG72wWGSKgkaPlP3SJk+dALlqSkJgbtM+CfqTDy1gZRa1sdjxfXxQm2QKnIt39AjYYUdctPdRLdTKfhIkuX8hgZnBYtxD37c4tLqeNl+kiUXqywUhAFC3qt+DG5ECZ+dq5BAVYetBgzC8kPczhHjMsNB2Y80KWDMjRxmGxh6Sr/scrtB7568+W3k7+51jAtPd0VO++prxSQIwE665w68fo9d6Q9iwN+MGN/i313CrXJPByC3dSjVQVhDrEdPP+KDcSWWma8SCtw2gnw0zKgZ/GF+oThdi4LKUolE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6s5hABVFmLn6pmagcy/UVs3FlZR6imkr1GBls39Lno4qiG9pd/7jVzHocyb/?=
 =?us-ascii?Q?b+JGRLTBu+mP3xQH0r0NeAOCUraUqPRiVRWcHx/3G2B2N5zi5YeQJjpPGAK8?=
 =?us-ascii?Q?jyqaQfdPUoo27DWOCFn061OjCXp4/yrmtuZFrkKZeSXDt01yG/GPdiqhdPrD?=
 =?us-ascii?Q?dcrLVM7H48yIZAjQQBskPQto/pV6D5nzdvyc2w38EoRTRfAMpb7Kp4NDfz/u?=
 =?us-ascii?Q?qlnWhZHFBUB8CHYV3K/KDNuFjjLHiKL8C5Hl6CLgr2JKWyGodKp9n8KTRVWi?=
 =?us-ascii?Q?Yg0T5hLDkMI9sOyQZ/C0PoaOV1j68OPp3svXMlm8WlhvEKHjzzmkUqbZ6cIX?=
 =?us-ascii?Q?XgDIBhcCeb0EE9iiYGdLLFsV4nBHb+Ph7hJm9UB6ufH7OL1IVNHwbbZqIMLu?=
 =?us-ascii?Q?ZLwvhzazendWFov4L+BBBh+AZUue6/g+TOKn9ihVbmBXRvr97o7+vCM5bAYQ?=
 =?us-ascii?Q?5prPcMYWtFVvB6yS8Ydc/ZPcITMdUPCM5H//VVoM9lAnjt+G0WiiOG78oG38?=
 =?us-ascii?Q?RtTvCBHUd57wzriGX6PxdDM6nOBgnbe2B+K4qjD/2/CrfNUHFcB0ZnI4SY4h?=
 =?us-ascii?Q?xdHU2ZOssvWMcWCFDqZJMYFVHzKOvBJOxOqHLVdlZSzmOo/1z3T//KNFEQ6d?=
 =?us-ascii?Q?F1y1Xt1cmUiaj5SFxsUzP0rMM2vOE3rqjFQC8L3Sa/gk2b5Col2A6zBO3dDk?=
 =?us-ascii?Q?X52zqjJWlyzS2NBjZ+JcDI2d6zHTJEGieM02VrFHhrq94HbUNbOUQjCKVob0?=
 =?us-ascii?Q?POl+sodKxZ5/7CaH131cc4AUvy3IL2bEwvlcJ95e6eKKHrINvhauJAqa7rF9?=
 =?us-ascii?Q?y8sc2Yo15ZZn5G4TNTPUQo/PwXRANADZ0X4o1qPonELdKXR3TYigqCmxTy5F?=
 =?us-ascii?Q?V81XyEhVlwJrjVSFUO19aYAvc4JHsqH7zuvIOZoP3WXAhcDENOqU7KW/t31i?=
 =?us-ascii?Q?2NnvfNrYfyfkE7ckT340kuvWIeJzNo4JpeYNM316K5LJ8WcMkCp9Q+B4GTdE?=
 =?us-ascii?Q?J99TquDnnUildHyKoMFn3MPAMr7Cf6Dq9L2mKphV7O5lYc3bvj3J/6x8xqb0?=
 =?us-ascii?Q?850yk1hBdSBwRD0/KbbPadg3M4SqV+ZkBaZJFsO79JO5idMKBeFFpRsmbxGu?=
 =?us-ascii?Q?hzwup6flWeihJcz3+oAmrwyvN81bDLbAFxkRjD8MDc1GS3kFdrQXHDGPYRWP?=
 =?us-ascii?Q?5F/iAq5pmN7UwiiePul81dX+lqSFErZeE3MCZxJySXVA77Kp/nDfp0tj15og?=
 =?us-ascii?Q?yu/958hK6zt9+8UbSbpUWlmJg9UY8KG/hkcO1W8A3kqtdlkG0O3Orop7Rkmp?=
 =?us-ascii?Q?ARYKgtKQ3FIaHO96cMRDy9mfN5aEYLHJANDnH+Wk/5nODDXfwDvDJ7GCVQ//?=
 =?us-ascii?Q?x79LXEqptDKnazHVmmbcQhZn3wLKD2iwDlwelcHGAkmZyWtkF7CgQxLUMSM4?=
 =?us-ascii?Q?jMvsfiXkx94IuE+fznSUn7jZ0e7XC4wg+j+PlT8tOHapLxt8JyNM3NRU8Lqs?=
 =?us-ascii?Q?cQAq1TqV7Sz18y6RrDBbnPiC2O9dB6IfZBSZCnLXNDSdbjaOkDqx5E4MHxY2?=
 =?us-ascii?Q?l1C4t26wuYeI2dGSZAy2/emOvykQbyfjOQweAdQyOVDEHDrQLxeDGlP+toIf?=
 =?us-ascii?Q?dRbjDDOhXhcdCssP72+CD16KzWxjs+saCmQlCrMzVBJTkq0+RvliMjMiCI3I?=
 =?us-ascii?Q?J9WocKnQaR9uicNzrrdqqQjl3l+YuuH4miceszSYQag7Da9X5KBc2M2pbuxR?=
 =?us-ascii?Q?T+CaAMW9Q2pG49zW4SnNQYPo6rL7f+zEPeN96h9PJSY7r/gGmyOZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb45d54c-c7fd-48e4-b788-08df085a5771
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 18:53:42.0531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojBMqPGn48745n3u/up/5lqhqHjLpZ7qfzXt2ttw0ZmWuBmZkqQioyAXvnjTdWMIxWawwfy6w6efiNmEFfldkT+sumFP0N3ck1MpjOSJZkmCV7nWBx212wgM5lvA0aRO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

On Tue, Sep 01, 2026 at 02:16:05PM +0800, Jia Wang wrote:
> axi_chan_list_dump_lli() uses the channel-wide descs_allocated count to
> walk the hw_desc[] array of a single transaction. If multiple
> transactions have allocated LLIs, the channel count can exceed the
> transaction-local nr_hw_descs and make the DMA error path read past the
> end of hw_desc[].
>
> Use the descriptor-local nr_hw_descs count when dumping LLIs.
>
> Fixes: ef6fb2d6f1ab ("dmaengine: dw-axi-dmac: simplify descriptor management")
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index 742e08cfab43..61230d2b1c56 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -1052,10 +1052,7 @@ static void axi_chan_dump_lli(struct axi_dma_chan *chan,
>  static void axi_chan_list_dump_lli(struct axi_dma_chan *chan,
>  				   struct axi_dma_desc *desc_head)
>  {
> -	int count = atomic_read(&chan->descs_allocated);
> -	int i;
> -
> -	for (i = 0; i < count; i++)
> +	for (unsigned int i = 0; i < desc_head->nr_hw_descs; i++)
>  		axi_chan_dump_lli(chan, &desc_head->hw_desc[i]);
>  }
>
>
> --
> 2.34.1
>
