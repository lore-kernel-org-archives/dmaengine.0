Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649A83D6CB4;
	Wed, 23 Sep 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182059; cv=fail; b=NBjvZQdd/mFQiQI0aNxBFJmQhSyrZn2ZCMbfTX5HJYxvfk1JpAG5bGaicCeQEXO2C3EorNzADie7fV1ysFcEShvCAck22cnkTDMo1vI9W2Lb6ST5PQqFs86t8JMbVNEP0u+0BOIOswyq4SnN7vhOn42aDy+o7Hkh+axGopA5r9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182059; c=relaxed/simple;
	bh=6HRyqcsgv5AhBYqwugHtVlVPLOMhEo9Ub5NmHJu+4Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZSqYuroyfN4BHSKpHQr9FWu2DE4W7ffiJ8TNyDCjD8PiPdewIcMheg0tDK6QwRugZiLWAK6Zq6iKfL3wauEtS77zrzmPlpbBHxw7Zbf84UC519sCOueZXQ+LbJdhxhLqWDiuX/1Kf9OJ5w16LclVIad4/L/Ai8Tf4EGQ47vlJf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GexxnocM; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GexxnocM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bP2h4o6t5Xw73jrvloErD7RTNIyUAkH86e/UHlaxogfavIYRsoSxERkvR73yOAOkwjkaQzJAhUqm1q1Eb0PqU/HYxTa0uaN/+v0X4HTHzGR/o4HgVcggfcT+eme0Jfrim7rey3pY1IASD37Jb5F76+T84EPWeDFAf4xv5Yf6wGaTwzqn5tG6AXGvPtRHcFVOymV/nzXUbgFlccHsMtQHEkE3wddbTMkNFU/yrFQZBCIqTtm8SXlYRRzcBBlDjeNKk0gz9zzXCJakJZsqFpvRF3KLYBTWuTlXdFyyIDxkZHf4b2OVscZfDFIXkauxSSAktCRVvaMDqzoLKfi3qq3gEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp0kiMVx9lTa1TlSyIXbcVDR2RLfXvcxVdkd3cD5LAU=;
 b=ZDdNZrO/BuCraujrmDxDOO0HDvWWIUsVLI9q+MFh8wiaISJH7BrS1ZQVZuecAEfSu1w1zjDsbOG7DLP9uEN8cEPQWHx1xXYnO+wfBCX7QCQ2R5W/kTeDy0Nd+pPWtVcrUkTgGk5XI/4SuhBQirvlEostcu104N3JR1IZhWiyt+Y7Sfg0MVYPvkUbpmuNgIWN0a8yy0vAeaLUmj1lEvzjnDQG0qEReffa1S16KyN2TMLupBHMi8oY5dg7d/rxHpf4ubjGCu8ShnIaEjZOagJlv8hHtKpKd4fOJXWo+OUAM1GquvzK1Li+O/Bg/eilM37ptptGRwV34+R+dDHgsBtlsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp0kiMVx9lTa1TlSyIXbcVDR2RLfXvcxVdkd3cD5LAU=;
 b=GexxnocMvm0+6YyyYd2Ldqs02ES1GLd0K3eQZqne6+Lm+2lEBOOnduluzwMB6azHipDQ1hUZNHGgA6JOTX0mswt5fMY0e2e6dLLPTdbDKpX2YMBDfGwzpqHrIbXvZiJigOwn6A4vmjH6zwpz4USSa0OHdVHidfXvDeCfXfU4sxxOir0BeHM0V2y4d25myJEBg1u+rL4Z9p9sfIXN07uH16PQnw68N3QekTubNFhBMG5XhLJK4x6EN387vuQo3Kvo5+GSLvfLqM/w6lmCyye+dpVOOf5PDPzIrlOno+9PqljTuAwXWNrgZCo/j86U9WgJmJSpfZ6mdoEKQl1mjZ24pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7601.eurprd04.prod.outlook.com (2603:10a6:20b:285::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 16:47:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 16:47:20 +0000
Date: Wed, 23 Sep 2026 11:47:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: phucduc.bui@gmail.com
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Chuhong Yuan <hslester96@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: ti: edma: Fix missing pm_runtime
 cleanup on probe failure
Message-ID: <arQCkAolgGPrVNqI@SMW015318>
References: <20260923072532.19307-1-phucduc.bui@gmail.com>
 <20260923072532.19307-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923072532.19307-2-phucduc.bui@gmail.com>
X-ClientProxiedBy: CYZPR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:930:8d::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d96701-5418-44b3-63c3-08df199255c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|10067099003|11063799006|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	x2zH7WPL6lnmkNzrkpM8uUndCzYCaGlgS5kSYbtImNllqw0SvCcKo4ydoM8b8aInrUQtwKRg63/8VRwdU4JRr6FqCaQPyciWE+zVL6Ga4BrHoIeNQibE2YAEq/A+0AqVEA6TraDY37cT+0G5TxTSflG5ILKdZWcFRgcs+PBkz1K8mLEhrv3UWAZYumeg/6S888slwFNKIm6F1e1DxXasldcWI+h9CtXERrM1t6V0gylE5svw0xqZ9BEcnmSjNWY+VkmEqHOA0vgC3OOCax6285lzcB5atqKgkL6CpiOKf2CAhdj6LoNjo7pNAmyxGv6fzZrOMw/D+ef2ZjRu8lZh+kevwcXUngoNPfuJjdbRzyLPWKIxZ6qZA/jv/Py88zgiAOP59s0phs8O6NgDHjNpMULc2iQd3czPOLLxmHgzfFZQDQLEmYTT9x6QdVlK1eUHXc9P0fMfN/4VaZkFUE6JxTNNSop4DEqHVTP5vGVkIKDx/sMyMqiYHReXv76LKKDwLSGmOkscYIc+QP46v68Phe+TAriHhcsVjqlgZQ2wwVdVDitiD1ApkSeuvsXITfz7yLN28SXi94ets5RYaQa1CPMk12+L4Iv4wKc8oKtN2ddcOh7lQSwoQrZyOA/vDigICGMLwSnAK6lJ/tSRp+dv/PORVTYj6K3vPNH8UKY/fmY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z0AgcdEaqqX29Emcfy0tnF7DPM4A4KSS1C6sP92Mc0vFOPnAopxVfarDUcSh?=
 =?us-ascii?Q?+DgVHc9Rkphn1XcdlrtqIE5VXhWiwXXSn96z8J8g1EFhXmmqlckyjDySUJ34?=
 =?us-ascii?Q?QxxLxt9rm/Rvn1NaI97asLBFT9HEQeDdcazvmMLhf6dyJcmyhdPQuXMPIWoQ?=
 =?us-ascii?Q?evO/IBCawN8rmMoFi6NIkxHLExYjRTEeCrz8rqzVaztPTQYo7sVzEx/zlqW4?=
 =?us-ascii?Q?L9yZD0zkH7tv1Ja5MMZCpG6l3ovz6L6j8nk7fH0JxkvZ9niDrb6esGFeZiLN?=
 =?us-ascii?Q?1TqSxUp1JB5KDAd7hSFDGMHN31ejGeXmdwO8mHUJditHG+XPkcAWAw7aowNZ?=
 =?us-ascii?Q?hinZn71mDL+1IUo4Iobl+gLO7J8K/FCgPj5hamRgIuL/Q54gikUwDEsn+lJx?=
 =?us-ascii?Q?KiYORqxV1kbegZdxFQ/3MIvYg2R+zuFV+a6npW7JZSracxO4RaIv9Be3zYAb?=
 =?us-ascii?Q?Y+qHqyZ4+57NIzcNZZNjbQXej2BIzfHbTdnWjJtLMeh1w5irSz0f5Mb/LTRs?=
 =?us-ascii?Q?3/HCFV6m5NIIdlEsAnkDbAFXflGuToZtXTVxSkGXUIv0/JzS6aPJE6D6XJDG?=
 =?us-ascii?Q?muPVSamYBtDd3LojdfoV6Lip8FXWDp6jJ69Ou9ze8X5NK6VW6pKP2e02iTq/?=
 =?us-ascii?Q?VDmRjDVpJ/EYZtZuXY6bCaRq7Bi1MtPV1HTFeTVQev5P91D4I5A4KSsOF31C?=
 =?us-ascii?Q?LGk2N92pWJ36iTIJHIbWFlk3ChIfdkK7cELzAAg3eC+o0D69w+8WWzT5qOiA?=
 =?us-ascii?Q?JvRdYGs3FuMNyXTb904+LHDRTa78LB7lByjdP7u0TdCVd8P7t7JrT3NDPWHF?=
 =?us-ascii?Q?DIx18mMyrKnQx+2rT4v5cSsI55pNPvvFBU7YYLQJ2sWquHngqhmVl/9YzRlM?=
 =?us-ascii?Q?kpKqJ6x4L3Uo+7qwnH1wcaP9TLasU6gwTNua2blLvTjmHK1DXedWLhbL7LMd?=
 =?us-ascii?Q?H6qvmCFWaFlgif2TizMET+BtlGFw78YF9tCDFf2DI/YOOetORRG6k7sXBnc1?=
 =?us-ascii?Q?IzNVndwFeHwh4gEXCSMm571LNI2qGb0tmm5EpEA+kKhAII1pOn12MbU9tEk9?=
 =?us-ascii?Q?eLij87v5wxuR05IU1K4oy0/+Ulg9IsAVIpe4ggjt6UgRzBSUIY8/QgZwAN39?=
 =?us-ascii?Q?xwaclBV0UYh3VNntC8DXLVil8AMvZEb3lYk4bKRwBRYanv1t9fjgixKwkZnS?=
 =?us-ascii?Q?FAi1UJmx6aFvn8lyRArz/67z+xJA7ZD8WYHO5ndxD4aev/a7VFwcSgZd7ym+?=
 =?us-ascii?Q?bBeaF3+8pl+yIQnDEEh+Z/nyvuUOBBT+PsOp8rLNHMpYqf86Zxvc/5myUHJx?=
 =?us-ascii?Q?Mnx1UXkswjmVDVK+OgVMwznAI8nx8m4EfDvEQ/0uMUbIriZwUHobdPimk6m/?=
 =?us-ascii?Q?a2rAtw/OdEgN9dFeXeuoNdP0P4Gb0mJXoV5QF1N7RlPGFfAUH4+VqEBHDcTf?=
 =?us-ascii?Q?H6r0eTOrvU4aaaZsfk3knC+agtlnm8iAS2Rw7e4E416mdGFvqJa8CC0NG0+v?=
 =?us-ascii?Q?tNKDzb1Azn3zpR8LrMpOMGY552cUhI52BHNbeDLy0XzqQaiSBGO8ajMidcNh?=
 =?us-ascii?Q?UrtBIWStBCulk7NywmVEOay/QR8JlygmZQbXVNtVitiwM09FI0MWZaF6O9rk?=
 =?us-ascii?Q?mQPhSoojY0mUY6vYjTpP/I+RDqtblbjD4S6LKh0wBjeRtukIuSDwuXN3oxn5?=
 =?us-ascii?Q?AQmST8ZBdX3m31gM9fPYYoZdQjZCdENvT7VMcU4FZsHNFcdDhMPhaRIHf3TC?=
 =?us-ascii?Q?8+OxzCqeUSmfzLDsuVOIKJ2UEk7bpiw7OflIxax4vJQXAaxvyBAp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d96701-5418-44b3-63c3-08df199255c1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 16:47:20.7720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBlNFzrWNIZFQI2b7cMtyHKyxsZNsiKKHbkeKfJnhA2L/mBxURVsRWGwEkIX2hfXiZTOuHxlMeCQYIuYKqhL/TeOUMDRsLAFxMujNxMcketCTynq8lez7bm/URodnVFA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7601

On Wed, Sep 23, 2026 at 02:25:32PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> pm_runtime_get_sync() errors were not checked, so on failure the usage
> count leaked and pm_runtime_enable() was never undone, leaving
> runtime PM in a half-initialized state after a failed probe.
>
> Switch to pm_runtime_resume_and_get(), which cleans up the usage count
> internally on error, and call pm_runtime_disable() to balance the earlier
> pm_runtime_enable() on that path.
>
> Fixes: 23f49fd2ea9b ("dmaengine: edma: Remove dynamic TPTC power management feature")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/ti/edma.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
> index 8be9e71dab76..5254ce7b8514 100644
> --- a/drivers/dma/ti/edma.c
> +++ b/drivers/dma/ti/edma.c
> @@ -2650,8 +2650,16 @@ static struct platform_driver edma_driver = {
>
>  static int edma_tptc_probe(struct platform_device *pdev)
>  {
> +	int ret;
> +
>  	pm_runtime_enable(&pdev->dev);
> -	return pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0) {
> +		pm_runtime_disable(&pdev->dev);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>
>  static struct platform_driver edma_tptc_driver = {
> --
> 2.43.0
>
