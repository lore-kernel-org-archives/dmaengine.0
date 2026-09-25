Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753F619CC0F;
	Fri, 25 Sep 2026 01:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790300853; cv=fail; b=E0VpLr83rLl2vAA5yIACE0BO2Gz1pOeev5eZ9/nO/rdUbyCx2weinX3TAozQhaICPQlr2UC0gGGTpUYP7cPPGjp19H72fxSkiNlP4NBJDttVkzo9Bqrv1maWUhr8qmE8MRFcctL1NMw1/4fOAqbnhdCZBgM3vc4piprNe/LT70w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790300853; c=relaxed/simple;
	bh=BQ039dmGEZBoXlmvmOa6S2HBxExHGEeLeXh1XaRBRNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UfBygKDlsNKH/D8inLxMifbLCd+Hp4Iw7kpWj8g8Qkd5mqkA/TxOkg+7HbhD9cpm/dhns1psFPwpLJx9f9uXdEmLAdrdYpI7LG6SQmaDZEendyBKTLTgErrdot56e+l6B4T2YFQ7cAR3+Ob85PjmL5MP1nA8+Kaj6sFBZVnwvWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EAHhwFZR; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EAHhwFZR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCecZ9CtpnEc7vBD/g4dD1zrkH3BYGMx7f4HL1aiyuQcb+ybHhfStDZJseAzGRffexM0iKxdcNZ1GvREL2hREDHdn+qfBLYhF2XmgZtOe5BmU81j1vMP7QSCbjIGnvPlMr056EvPzvSX9yTw3DOe182iXqlb8p3W7Xq6W1/EQFmSpUtfErCj4Qm4AhNLTN8vAZJKWKx8x2gRWxHK+Y4Ys3eLPZMVzYOUwPMc8x0Bc/kMIB8eqxofM5JY44FbQzzvMUT+LQYO5cGXCkUQ7Fiy16JlE8aXG4ph6aybSje3fT4puFshf0wwWM4TjkMyrmpOFTMQ9az7tljTv1e3d1fS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LpgHrRnJnI2I5GlqoOwrsqUlD08PGb1FxWLCkR/D4w=;
 b=s+AqzwiUoaBxBoGiWdQcWpZ2ckLSKAJ0UxLM9wG2y1TEx3t4huHhNLAmRkTL7cPXiZGxQ54vNozkklAmpI+qHWMBtE14fGuWiqLkDj+JmnMB/INfMjIL3wDtdX/wFv8ABOOQyihBheF3MzYCTIlJa1qQYaRuvod5hMPhxX5mkYY6xhI8yRhB1X1vbea9Emu3z4oSXw+eMEStne0wa+qx2w/qjBhNRsEo0vIw/qAjcOAN25mrTkOjBSeuV6PXIV8hvBKLAKzJB3iONthKy4ypK3i5xrgrZCuxqOMakLlZ8ve2EjB4id8RHosa5KpQdfity2x2L8ZLl5QRnpElg7zUOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LpgHrRnJnI2I5GlqoOwrsqUlD08PGb1FxWLCkR/D4w=;
 b=EAHhwFZRGA1kwcYUpU9p9Pmv94cIqxhYWfy6ALcQLAkJ9oqR+tsg6v3PWENbQwm+K7qFJ8HBr4iwxYcb72oywZXiqlzZPBSWN2Itzwwxk/9WquhJPJA25/bxNAnDGewvQPei9U9ZXyLeOCB52bTjDu4vlPcYaKD2lTCQLA9Hj11zRUHGPS/NgFxdRnqXmIclugGh2rrvTE2ODQ1T3h9KBO/7sPmB4gtD4YKdrCZKB2xV8nB1yZYvBk/loIWaimB10vS4wilNxQcyggjL8xXEwtLS6Rzf5SUvtGTGmc5EFemmxskiBeG91bR52T0ZjzEZ8gnQ8loMNLUkDUTCeaZnTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB10646.eurprd04.prod.outlook.com (2603:10a6:10:58e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 01:47:29 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 01:47:29 +0000
Date: Fri, 25 Sep 2026 09:45:01 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/3] dmaengine: imx-sdma: Use __assign_bit() for
 ownership configuration
Message-ID: <arXSHcT8uVF8Aw3d@nxa18884-linux-1.ap.freescale.net>
References: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
 <20260903-dma-mask-v1-3-211ffd12c236@nxp.com>
 <arWJBi8iHhaeNfcr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arWJBi8iHhaeNfcr@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB10646:EE_
X-MS-Office365-Filtering-Correlation-Id: 144858ab-c24f-4a4f-1790-08df1aa6f53d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|3023799007|10067099003|22082099003|56012099006|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fqSSqn//xtgbptliEu6OaVdSBMK6aeXUn61yxI29OoY85eGYPtals+0NvOryaHK2LmPIeu9H8O3FPBEpsFaVw8dAqf+PlTFWyliFC6COITSWijY6eP8LJ0cW9bsDwghlQMBDOpsUyXNNnXzeELd+6r7BVz3g7/RgOdOrECD4DRVvTq9bZSITnU/LuVMNULSmasNn/D5aVQLQSnH7cfBPLl9QdHFXeFTQVysU5OGhbz0/YXjNECZg+tzg/4ugfG1Fc6sedZytDWZb9sMO08T5wgoq9x+1Yz1j7HlQpSrdT04Rzv8Wx7KwUawH457+K1K/bbzCmQR1pLx8OLSaO0geYjNXB61ya7XuGG2IfgksnETQaf+pTWgOrySYeHvSfyCyXqgQ0/8it+hQvURnF9KdlQr2oobXuXCc1nTFAnGs/TyF3cpcHSvl7OTnPkoa3q57ro9DjMFPosJ2sIUdXmxJHXVRwyy61dxgDNWEr016NSwup7MEvH7UIqurxTmpV020geGjYLbz0RYrO3CxOGBmFdUPFG9wR0YliaD9+Q10Ehu5TGVjOCnQ58R9yrI+WjujFXl3UjF7zKvW4P4/5p6yqhPnWJNsPznKRKELoMhlJFBynFQ1Nca/Vyt8nK+fVtPo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(3023799007)(10067099003)(22082099003)(56012099006)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MUEzSwBpMBVnmjP9gAIoSczYMxfQZatKBA6KZXc+Ou3UEFqts3skhZN95BC1?=
 =?us-ascii?Q?/aIIkMUwTHP1Xex++X7v4C/A0hfPpINIaGPJRuvGwjn/iM+ET19WTA/b8Rbk?=
 =?us-ascii?Q?GddQzgREE5Pyj00KuTNvlvvUGtszrLjbAQG/WcaUHpqneB0HDMlQVRh2MGOq?=
 =?us-ascii?Q?U44pz99cMyX/XejGK5j3Yut+hkgvCm7zuXsbd3t9beJdUXr0iUzqjC/SB0F5?=
 =?us-ascii?Q?mliW5CeGH3d3eYdh92yQ4IyS3BZebyOO9a5MEYQt/xFjZ517gtDsjC4JIb7z?=
 =?us-ascii?Q?HOsOmukz8EhfgbT5uBT+jfOae0+f/yIKfg1qQMYxs3EzVJi3oKdyO8lDtZml?=
 =?us-ascii?Q?5qygkTw1JPm399ZmQPlAe/f7IeZUdAFr0uNiKsWkAMwAwH/v1qA+AB57uj2y?=
 =?us-ascii?Q?JRpn7iH2roZPaggvY9gmmPPyCOEsDP51zfkcFNwqSCO0+aCymM2f+2E81UTq?=
 =?us-ascii?Q?RdeY9oZxl2nW8245FkkbYDPnAz2EpdZPp0ToDROS142UBPw5AvYtvX72/ZZa?=
 =?us-ascii?Q?h1K2oQv+ibGCgzbc6Wr2sdKxYlTkRhob1BPMestfwNXn9Hxvcen9jFOQRKQi?=
 =?us-ascii?Q?R3wxC4rdf6mdf/Jh4DOe3GrcaG7Wu6ILmHn3unieRwaaymHBN0TZWy2I7rfv?=
 =?us-ascii?Q?9S2odf5nsI2MuIJt6Lhj5kAbOUW70UKJ6FP0+dLJuQwC8o9Q6WcqbnH+Gjs9?=
 =?us-ascii?Q?oMEGWg4biAYd8aYKgeQfQuAujjd15dEzdv3a053UN3NI+gmdcXBkXNI15lPb?=
 =?us-ascii?Q?rDtZQbVZrb86l5T/hZh4oogyXR4uZQTxvP/Z6JZL64kIot+++xjFIGpjwIWD?=
 =?us-ascii?Q?D63AaDYJp/PurWeWZokZeHVYdm3ps9eTxN9CNetmfUN9+Yd5CFmgenmFCwPE?=
 =?us-ascii?Q?IaMAl6kse/BCqFjv+LUjeKgDZVf5sTvXh8VgbSMNoTzsA4vSc2oK+iBGm4HN?=
 =?us-ascii?Q?57MNyr45rg5igyTvQVSRwVMILNLG5JDrdvDs1RUNQsguRwr6k8GJ1VsIIvme?=
 =?us-ascii?Q?qxggndTj/xHktRygmd1sTgnHZ3n3HeZhE/gepY/bLomzt2SOPuhJj8oNJXH2?=
 =?us-ascii?Q?05Q1B2zcTy9eCYMLt4H3U71u+5m99O501noVxhlVsa0yf45DkPC0FJvOAelb?=
 =?us-ascii?Q?BBJ2gpXyG5/Y1/Dq3arQZrrKOUYvMYKyYdgJi1nK9WPIXw9GEJ38D1xvd0wH?=
 =?us-ascii?Q?Zaz8Tc+KJl3QaOOkdwlg+j2qg7R20wcuNCYpo45ZgxAeIICddbgEFcd/x0KU?=
 =?us-ascii?Q?X9aABZqbahbDAp+eqKki61fubmj+8QuCsk6aybmWVSkFZltmpqsgmnbPo4rM?=
 =?us-ascii?Q?O8MOInHBen95uNL7pXbx3buv+9F6J97ZjdyyLYeSOS9o1uFQhs+EIWMnHax2?=
 =?us-ascii?Q?RxQ54Led2rXhoTrkMhzenRqd/47QYG+mCM4p/xsrTCxftqbzN+htFJZRWMsD?=
 =?us-ascii?Q?C7TityahWmVkr3EI86IPxuVr5hQUKtF6QPeBTlbe2B3JJUnHLX60hX4XiRlg?=
 =?us-ascii?Q?6Efbn3JrY501KCrU4Bw/bvM4j7p9MEzleHBrJsZQuc5GW2J79YAStz5INYk2?=
 =?us-ascii?Q?2yKBtWQU89hdFP3ztvWT3j2KyryifNcQoLCr4vevQ8OFslV+nfR+ObOCjoZi?=
 =?us-ascii?Q?+1fKD7i66rUq7H+9Oy587t9rIy9dpAfVizGKvIOd+XyYg0OTAEyfdyJI2sV7?=
 =?us-ascii?Q?JRPmEODKwM2602MGjMtFmJgrQlaClz2MWuCOoG3TaQnkhAM3UBFepHf3sC4+?=
 =?us-ascii?Q?mbeSJers98+erdYa7XEUqMJ87vVvMbVSACOPOA2gs4AdWQ2b5t4s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144858ab-c24f-4a4f-1790-08df1aa6f53d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 01:47:29.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxCiJjD5xd3M4mmUkSmjKLpsY48dWoETKD1QjHZcLupjN65K5QXbGhwKvua12czUUEtUsisQ1Ejh35z4vtXPcqP35Uz88CWU2gdVMeeafCRw+D3TrafT2bfqAHmgtR81
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10646

Hi Frank,

On Thu, Sep 24, 2026 at 04:33:10PM -0400, Frank Li wrote:
>On Thu, Sep 03, 2026 at 10:16:14PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> Replace the if/else pairs of __set_bit()/__clear_bit() in
>> sdma_config_ownership() with __assign_bit(), which does exactly the
>> same conditional set-or-clear in a single call.
>>
>> No functional change.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>
>Reviewed-by: Frank Li <Frank.Li@nxp.com>

Drop this patch.

[1] is the new patch to cover all in dmaengine subsystem.

[1] https://lore.kernel.org/all/arV6S-U-ArZubwka@lizhi-Precision-Tower-5810/

Thanks
Peng

>
>>  drivers/dma/imx-sdma.c | 17 +++--------------
>>  1 file changed, 3 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
>> index 63261ab6402b9..da565409beaaa 100644
>> --- a/drivers/dma/imx-sdma.c
>> +++ b/drivers/dma/imx-sdma.c
>> @@ -710,20 +710,9 @@ static int sdma_config_ownership(struct sdma_channel *sdmac,
>>  	mcu = readl_relaxed(sdma->regs + SDMA_H_HOSTOVR);
>>  	dsp = readl_relaxed(sdma->regs + SDMA_H_DSPOVR);
>>
>> -	if (dsp_override)
>> -		__clear_bit(channel, &dsp);
>> -	else
>> -		__set_bit(channel, &dsp);
>> -
>> -	if (event_override)
>> -		__clear_bit(channel, &evt);
>> -	else
>> -		__set_bit(channel, &evt);
>> -
>> -	if (mcu_override)
>> -		__clear_bit(channel, &mcu);
>> -	else
>> -		__set_bit(channel, &mcu);
>> +	__assign_bit(channel, &dsp, !dsp_override);
>> +	__assign_bit(channel, &evt, !event_override);
>> +	__assign_bit(channel, &mcu, !mcu_override);
>>
>>  	writel_relaxed(evt, sdma->regs + SDMA_H_EVTOVR);
>>  	writel_relaxed(mcu, sdma->regs + SDMA_H_HOSTOVR);
>>
>> --
>> 2.34.1
>>
>
