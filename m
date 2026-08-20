Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7F469849;
	Thu, 20 Aug 2026 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787239714; cv=fail; b=feWmaReVScei1usUL13xIm2Mn5khwifdHThYP6zdR0rWcjBqGh0oQfbhdws4Elo7zL6fabBW0iq9ftjWGm/If5wWkWQmrQxR+wblF+h3fyY5+teQZ3+f2Eh4GTmjiciuTr2K33/ohxq/UMn7DCeZz6QmlaZj8tL/TR3rrZr5ems=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787239714; c=relaxed/simple;
	bh=YAbjE208K8zEdy/ahCC7iVrHdL0UoCPiGmgOFDQiFz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O0Hwz8ml1ZT9UvJT449lTXLAqBLQtPPMr8i5ajoe0KoIy6BauYq34jIIcXAhfIHS2/MobW1wbGb5i54qGi7yQpdm6EUqHbTgtWgqqPq2e3P2XDQs175/NUU67iRnD0ol5WLpc48zSvaFuKUBg3H3PQF8MbcyAFlkoCdkQdbMNFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DNqAtUF5; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DNqAtUF5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgsvEsh0BfIhOHnCYNN8t3/PNnnxCMBPJaBAl4IzC/K6nWpej7D4svD8O8v94sMrh1EYzUdwYSbujtsamyGgsAD20U+TN+rfv5n7FFuddiOtUXJPP8dQHonBtj6Hb9Mec7a/y7vKrPtjEvKx34WDq8UuqS9RuwKqxOUDoZKuBaos31L5dnsKrnRzVBsGik6HZrZ0UuNyVOIN2Iex6SPgOy59Vg+k1nMWEPbL4AqmLWb3VIuZs54wYCKymwRc5QeBF6VijmI+LZF1HB3CloYW7y2SUkbKXdB/snD8jNvXnU1ur+QueNewkH8Rc2E8Vynxmdh2gWYkIXOj9mczBWm9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEIWcY9QHrCZ9tu7Arc2a/8dDwchBDhI4Rn7l4ytQyI=;
 b=oTFP13NMsZ+4iMx9tr2c4cBpnCOtkgpr8NaMEg9PPZiii1JM4KwUe9Umla+Hd7C6eRxlCjVwvCoMzZcwXh+ZqisEDLdt17Nnaqs0NvboCip6EKTXHHcLJBCLDbMntKV+sNjheT72kwallhAtRsR8l0eUtk+PwKHLY0Ecm3OqfaxSQDoYCqVbBOYKVxlxkej/HRFNaFpqfdd5H/6ttsEd3im4jVBSxSod0gC4YoBY2r/k3/404KUJiwzeO/n2hg/HQKxt0ZqkZB+h0LwaA4Q5v0vNG3bhI1ESYod3dXyQ8vviydsLovMTLVP8853q+a99e4tkVhbbtYPPmV0kneBn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEIWcY9QHrCZ9tu7Arc2a/8dDwchBDhI4Rn7l4ytQyI=;
 b=DNqAtUF5JflCXDOc+jBKzVZYK2dNziZ7iqIC7Dn9Nf+K8McvZkYLj/amMGNk7OglZSCqj9tOyzU3ykNYwlqPRNjMXYPRYXttRuXei4mWaNJIWvoovaVDP9M9qkWs1W1plC1GXJLpzyfkC6BwInupDhJRdwKTnylTDcqpy9OetIoTRq5uyrQtNGxRMOVENxIwO+tXH3tdufeUDhtwOyIJaxWtBZGJcjp7yLyitcXMoLXoxJVrm7rYySiCObHP/VQdePfMvMiL1OWV4tWRcA9EYL50rD/PxXlrT7RhMeOTrG8asqW+YaOgEqj6/OmPI9aVo3hB3tbnSoRFtSlHB6IMcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8439.eurprd04.prod.outlook.com (2603:10a6:20b:412::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:28:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 15:28:28 +0000
Date: Thu, 20 Aug 2026 10:28:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <aocdFqx-cRl4mUsX@SMW015318>
References: <20260820075330.2065377-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820075330.2065377-1-triet.hoang.dev@gmail.com>
X-ClientProxiedBy: SN7PR18CA0015.namprd18.prod.outlook.com
 (2603:10b6:806:f3::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 365e8fc7-ab3b-425b-1824-08defecfaf39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|19092799006|22082099003|56012099006|18002099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	eTUT/3ToTtOQVmsgDa+0sGv0OXtb7RsDr+l1hNOxHY8vLOVWkUe6Lgj87nSAro1x385kzn/aEaF/8JJQHb02bn3iS7s44LmyX7klc5YMB0cJEDr9Gy1dkzqg8Dq58FcNfLvjYqcgHuAg3HWyml/XvX4k9iRoNahD+VAx5qNlogvQat2dVfF6iquDlj7uHeJ1rTDYPUEVz4mkMNXUg+E8QvmmAcvhP9+MuGO9T5AlNF3qA6blX/C/+0bWHFxAzm1VSJFgI8mVDhA/cOMcj734Y0CgK0eGMnIhulH0S9I6byfgBJ1UYmVMhxK1FtjZmK1M8cBehiAD8Bi3pMD/5dwIgPuKhUDZdk/9xgV1vw/9uwHUhSmnS9CCF4gbkgE3MdV46eDGTfxtQT2xcr82m8xgvGTsKr0Ww2hwKkQl+myHdGN0Gd7f3t2L1UBwQmX7Dq0uoHCGqiIvC9O88EPQokG89/C2AkCnF5D+qx24djaGcy8PpYz/vRcCYPssT30h4B6lqilHNUb8exm2gqUOMHpKH/3J3hWAluFyjIsgoRtY9rXjYUQy47qEkknZkoMPjd6t4yR2bOLqwLZ2QX1HM1qlyvSqx+uJ1Nd+HwU4rV7wIMl3RootNibECYTmr1BP40JLsxr5edo8EO7sLK057iLZcVZE3swz654T7+Z/ucYfotg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(19092799006)(22082099003)(56012099006)(18002099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ywEXfsYY6yaWWP5za08erMAhyFlD/UnnDicBVPmFR77rM7pmoxaEPCyn8rB0?=
 =?us-ascii?Q?DKiLs3oDEuhy7wejBOwPJPal2QThnCW6pplU0ZsEjlDYrxoTlhowpWGSyCEf?=
 =?us-ascii?Q?LRX40heQJOP7uirgfjRdDjUeQ3Ri0PNBqsab2nayycrcdCWDMdbq8nKh3gYP?=
 =?us-ascii?Q?vZVp25POkuXrgMPK8ilITd/+H5oVBrVqoVwrJdvkMP3H2K1ofsvK3QrQJiFZ?=
 =?us-ascii?Q?R6Gjw4eeWvDSsaFZk/BQfs412IUuH4kxYLvmpA2cJZnDH18FQc0gn7MakBj3?=
 =?us-ascii?Q?HeCTi8fGDRfnNlZzJV7zOeKVRO5GViB47V68IRmt/vuXLFz1B2IOkUUAnxBl?=
 =?us-ascii?Q?pRntkuY0HMCkWiUwOgIUHRPFk2reKVM1IXTtvvu1LlfT/3UiGczzOPhGTHNe?=
 =?us-ascii?Q?jLST115jdGa4uMVGIhwwk8llYLRHxnFsa9n2JO1Nc39Xu1qOC7F7Cnt3OcF+?=
 =?us-ascii?Q?QJWGPLfTFtt1FZUpR0pD+WtHa2ePIuh9EvyntzlpQdgo8TbIHcF8KzSc9S9I?=
 =?us-ascii?Q?1wKBv/dnK5IFlKhZk2jlfG2eBMHbhJ8k/UINc94X3BC1j4bFgAH1Gm6yhyQ2?=
 =?us-ascii?Q?ZSYYuq1IZtFAKKGv+4gxBqeDFa+DtxxsyUadVAeQgruQGoVUKjuc8TvQi6+3?=
 =?us-ascii?Q?kvC2Hwo5PSnEhuiI5OVoBeTeRA1nrbXmj7cRw/e7jg38kseEhTABH6iOpPHh?=
 =?us-ascii?Q?UKBGkHNes3aphKF0HFcQpKI4RRum/EBD8h8cPmqj74BCp4DtE0XcfmyXDdpW?=
 =?us-ascii?Q?gkgrL/ccMhYet7o7faZwgztf2/pnR/Mm0G/B9y1ysd2Y4t91g31A2gXpStTi?=
 =?us-ascii?Q?Q178ZP9xLgNG+e/ZYJqGu60XAr1sfHoHRyf3ePF4YLMCVbqOhJcIdV+uZDX3?=
 =?us-ascii?Q?ndbOnhepvt+vwGSFejy28cfpku2Y0WUfTOns8TYRnynbNhaJQyPUiq0vkUgA?=
 =?us-ascii?Q?6199aEkn03o99JQA0aqUxp13QFJ/Uv9xpeF9VVbbaIiG93gaxF54UMGUsoES?=
 =?us-ascii?Q?AGxlKKQn1N+MVtCrXpqkkHOvuLV/d1o/rZm0jbk5Q3zrdokbbZTdDAgfAHK2?=
 =?us-ascii?Q?405/pUZ2gA8UpXkPC7Z2FyRfZfRl2LsGLIcwvOMSPZdM7yC2xGjOL2E+7Qeg?=
 =?us-ascii?Q?tLhbfx7ktJDFj8kp8yRMVuT17Mvs5Lr0ZcTAAVn2L6f4saN7LepANFfxQlGE?=
 =?us-ascii?Q?Kl308QZ5ZURizbA8fQlE4fCNxtPfvKJbA/VztwnQIEmw4wsvKpmkNAL9Zf7G?=
 =?us-ascii?Q?wtGPxOw9UOeZuY0BOEDhIpBXT0pQo2ICkuGPqKlbbC3hC/V0100dwT0tQ08Q?=
 =?us-ascii?Q?sqjZ3xYum4HQKFixzSBZOiObbf8nVFPMh11LiTFVcxs8J0MgSi1rn3TeYc/U?=
 =?us-ascii?Q?3gVifeQvhKk8uoK/fcdtE/qO8g/iPkWfj1CUqDczQFIAil5eLN78U19OIcO9?=
 =?us-ascii?Q?JKVWWBZjH54kkn0h2fgKCbejVjiJ5ASNKXNuI+XMDcsB4qmrqeHfFeji5sPH?=
 =?us-ascii?Q?Z7UDWlMbFMNQ5tTlcGsGfj1sc/B2sJBdB9E6fxxrTgaJSvkFpMaaoOj2gFYk?=
 =?us-ascii?Q?WgO3MgZ+XJT4svdHgL6gvzcl3i2JPrOMqSqAMjFxXUuJa5JQmIIu1RLUsaFq?=
 =?us-ascii?Q?Gf8wWlX/qZr0a5TZTT1f+OF77iiukSBPcjqSplvdJ/RnjT/rwU6lH3wvx8CU?=
 =?us-ascii?Q?Nmw1SSXQv3zwHkjc1YPkv8xs8w6NS//fezJQw6S7WqAv39J96E3E9KZvVFty?=
 =?us-ascii?Q?7EvfIjHsjt/h/cFRZyDWDpaJmWe4pcg2ZM8VozqBdHWF4NpPod3p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365e8fc7-ab3b-425b-1824-08defecfaf39
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:28:28.7530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOor1HfDoHi9e9cjo9apHOX4IvwZE4RB2P4bz1aLpVazclXqTYlyZHAKGJIX3LeJWpMYIC7EpUfAkVoJMH2huZGgj1PBcmVHdeVxO848nnDX0Sc10ZW8hzHWuvT7CRVg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8439

On Thu, Aug 20, 2026 at 02:53:30PM +0700, Triet Hoang wrote:
>
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
>
> This lets us drop the __maybe_unused annotations from the suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
>
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> ---
>  drivers/dma/k3dma.c   | 6 ++----
>  drivers/dma/pch_dma.c | 8 ++++----


Does other dmaengine also convert? if not, can you convert all?

Frank

>  2 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
> index e84f197fea76..e0138f5bfd65 100644
> --- a/drivers/dma/k3dma.c
> +++ b/drivers/dma/k3dma.c
> @@ -982,7 +982,6 @@ static void k3_dma_remove(struct platform_device *op)
>         clk_disable_unprepare(d->clk);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static int k3_dma_suspend_dev(struct device *dev)
>  {
>         struct k3_dma_dev *d = dev_get_drvdata(dev);
> @@ -1012,14 +1011,13 @@ static int k3_dma_resume_dev(struct device *dev)
>         k3_dma_enable_dma(d, true);
>         return 0;
>  }
> -#endif
>
> -static SIMPLE_DEV_PM_OPS(k3_dma_pmops, k3_dma_suspend_dev, k3_dma_resume_dev);
> +static DEFINE_SIMPLE_DEV_PM_OPS(k3_dma_pmops, k3_dma_suspend_dev, k3_dma_resume_dev);
>
>  static struct platform_driver k3_pdma_driver = {
>         .driver         = {
>                 .name   = DRIVER_NAME,
> -               .pm     = &k3_dma_pmops,
> +               .pm     = pm_sleep_ptr(&k3_dma_pmops),
>                 .of_match_table = k3_pdma_dt_ids,
>         },
>         .probe          = k3_dma_probe,
> diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
> index bf805f1024f6..e6d7c72fce3c 100644
> --- a/drivers/dma/pch_dma.c
> +++ b/drivers/dma/pch_dma.c
> @@ -776,7 +776,7 @@ static void __maybe_unused pch_dma_restore_regs(struct pch_dma *pd)
>         }
>  }
>
> -static int __maybe_unused pch_dma_suspend(struct device *dev)
> +static int pch_dma_suspend(struct device *dev)
>  {
>         struct pch_dma *pd = dev_get_drvdata(dev);
>
> @@ -786,7 +786,7 @@ static int __maybe_unused pch_dma_suspend(struct device *dev)
>         return 0;
>  }
>
> -static int __maybe_unused pch_dma_resume(struct device *dev)
> +static int pch_dma_resume(struct device *dev)
>  {
>         struct pch_dma *pd = dev_get_drvdata(dev);
>
> @@ -972,14 +972,14 @@ static const struct pci_device_id pch_dma_id_table[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, pch_dma_id_table);
>
> -static SIMPLE_DEV_PM_OPS(pch_dma_pm_ops, pch_dma_suspend, pch_dma_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(pch_dma_pm_ops, pch_dma_suspend, pch_dma_resume);
>
>  static struct pci_driver pch_dma_driver = {
>         .name           = DRV_NAME,
>         .id_table       = pch_dma_id_table,
>         .probe          = pch_dma_probe,
>         .remove         = pch_dma_remove,
> -       .driver.pm      = &pch_dma_pm_ops,
> +       .driver.pm      = pm_sleep_ptr(&pch_dma_pm_ops),
>  };
>
>  module_pci_driver(pch_dma_driver);
> --
> 2.53.0
>
