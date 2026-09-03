Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5604B3362;
	Thu,  3 Sep 2026 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444797; cv=fail; b=RwQCp2Xc36ULcNaboRCXmfugPoG2H9NELsL7EgrHVurM1Ne/Q5QsOlWOR3UVHd8ze+gGWHrbIW2Hfla6Z0pDFx+fVGlYmkCF1ipoWwMUTCNt9I4ZvZqRjr1i6GCX7Co9kS4zuIG/l74AgLCT0fnFD9WvKD0gk9wEpv35PF1pS5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444797; c=relaxed/simple;
	bh=fKFpjLbAK6boDuTQnrbFxaWG++ReVUuQadhpVJGoBhk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HyQxvwppBVBy79rbPoy4etNbZ2u4yX3LMFeAtoWAkd0oe4zq2f9Vfx9G7uuLyManDgtGZ47m2Yj+nHYF5TnwVKw9xP+a0Gb1Fu1zK2sL1kGAwamSpa+C61DgouwvnlUyyoTxVEfvs7S1npgz/69MgV4SbMXL/PAH0BrhM9zKGOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=buyfsoGr; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="buyfsoGr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNu5Yc/OnkMnIGngViilOc+qD3FPZk6k3WuYzKRcXuz6rJYBfMoqe7Ai45n3vqYIgtZbHZkMxd/qqxayF7CRMYyZ3nUfl81Ol4q4+zo7+myxtFFl2T8CLp4Tis4pQ41f7SBNfGqQe/KEkF1qeOwzcYQZBWNnerIVT6dli5SkWLxAjbWl/I8Kd7QNCK1BlKPvAQk8LC2jO8HW5hBzbXSfh2en0qXV8gPMK/EDNP/yTzwrynCytWeK9PBz3GQ1IJMhHzm4vcakVkHy2OJNx33lUTp0EAxE5kuLeGrM/lwHwifGYnpM1deD44ud0yJAJwrdkBCzbz+68ljKjLzQL1v1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp9kGmYnSpV1GnQ7cGjAcvXztop6aBR9gvD6y5VlmYc=;
 b=thZZcX301QoE9ZZdaKzrEEvJ+rrVPqITxrrFBTFej1HafSofco8WlYRHw/XWIKN9iUnwFqvpk2Sac8aqUSdPyqNAYOGAb9+KuqD0ZTT2Dx5v0J5ERC/azSGlkoogOi/ab9T7AtlvWgiosoaT03p9/p7FEl0t5dsqRiZNhOqOjlTge6C8WzPzuvJ7NhFqyH1UCH/NIDVjLTxDSFC+U5HED8f/W8cT/fLt7lR1gELqWZBj+ePNe6o+gR8KlTEchFOMimrx99g0NAXo1gYzynRmyhNS/ovtFVJEj147zSBCpRvQebiDfpqZqURGA+R4twhWvkV+8wzajLKgtrqsak9B0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp9kGmYnSpV1GnQ7cGjAcvXztop6aBR9gvD6y5VlmYc=;
 b=buyfsoGr7353H5YaGe2cID1x7KraVA921764EKuNKkamrsyQ2Jm87dX8MhX2OhtaYGWv+cgu4kJvj0zwo+eZatrl7Cn6WHqK1ezfq4Pf2OObUGJcXZ+YwIrwcUFDmiKkptwCQlAmXDYWYBPEBQ2BXQdXiLRSBtoD24xajMJo0JLcGVyIPHqKmBBUwC/nm+bTcXudv8WXappd24k8ORfsghe++FY4yhrleLWjDCAX774rmEF3FOEkiDFB/3dqgbxa539AlVMXS/eUIfNiuIewQLFFn5jHhu/yAYLY5wowWkCtOmTNdWfhOC5FLEliRYwvoQIE3hfu59eUs556bT16pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10303.eurprd04.prod.outlook.com (2603:10a6:150:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 14:12:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 14:12:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 03 Sep 2026 22:16:14 +0800
Subject: [PATCH 3/3] dmaengine: imx-sdma: Use __assign_bit() for ownership
 configuration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dma-mask-v1-3-211ffd12c236@nxp.com>
References: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
In-Reply-To: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0085.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: 04185a65-09c5-470d-d522-08df09c564da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	EgQDAx21Hc2dCSRhbmD1ACbTjIjhxcVdMYrIx/WZ+jUFsuS9o4SzuuRhjLydlmS9rI3Uhs6h5oupiz/iFlKNeVNOxfBg2HMV9/x1pyU6uOX0ivx/4r1xQbD0vxNxM4Pb+dwP/q+UdoWSv/pvaDzFwyX3iau92OwV76WBsEMeH/tIwC6RnxTHt8ggP6DFRRTYgdIT00axqUgxjubiprrMOVrE7TzBamHIKJUrFQfzoUzjd5BEox8Mgl74ZccfLR6HpUzOgNMkDfnrrkop/jetQ3UHvjGcOQ8QIWBajh+W17J5EVuQrqzbahn5NYqZ3KVMjhVw84ZCeyOwVZebLKvqXSlxNWYpINQGVqYGz3UnX/pxs2s/TNQqHeaaJkK+OhN/l8dzK6wdvD1ANoyWmExiYLbKIQ0hBwiCFu7j8uvGHTqlJTBWXBrdfI8gbhKoR5DeeSvGGduD1iO/3vkTzx1OYzYIlDhMtsH4TbkODbGEVyHm4DasnCzlsJh4ArKq7T94AKITzrGsOYewpe6DqAJz44Vj+AUiq0+APIASu7hDviaV6aBx5Q61BazV7d2GVN4rPcWEHMLJ/O+p4Eq7yVdGlcPdmGq8URZ/kIGYiBx54vgL2WKGwnIdmXw1B3FeFNmqnY1XCQFsf0/kVG7vjPVu3QDn7beGsi84t2ZH6X0BKvM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWc5NEtZdU02aG44UVdHdmM5b09NSUFSYmtzZUJ6ZjhkMENhWW5YUU9uR21i?=
 =?utf-8?B?QzFudEJacHBDR0tITDg5aFE5dHBFZGhhQkUwMnZDVi9IR3VLNU9LcGNSMS9z?=
 =?utf-8?B?MEEvcnpRbVpPSUx3OXN0NFB2SVptbnA5M3l0alRVaU10clJNeDNiZC9zNFdQ?=
 =?utf-8?B?aDNKQnJ4enJXajJOSFlxSTMrczYydlMvdWtNTmZXQlNLa1FiR2lhS0ljakts?=
 =?utf-8?B?YlhVdmdXLzdENVY1eDRXWDhXWU1ZczFZMVBaa0RNeWlVMFdyZGRwcWdIQnc1?=
 =?utf-8?B?cnYvckxtQ2tsOXVVcDliUytYNkRHM1JWaFFOQlFjT2JUZGhzc1BDRHVObHVQ?=
 =?utf-8?B?UzRHdXZtdWYxUlhMMWsyR0VpcnlNUEJ1VlBRWDJmWklheVRTR2daekJyQnVB?=
 =?utf-8?B?UlMrSjBFMmdFcDE4QnB5bEdQTTZkSlQ4WlNRTDcvTGIxOGMvRFlOSFltUE5U?=
 =?utf-8?B?R25lRjlFT3dFb0lCV2RFMmh3aGplRXpEaHQ4dUZua2IyNFJ2aU41TmRVV2Z0?=
 =?utf-8?B?d1prcThwVE5JYkR5SFBkVlgvRlE2MWdPN0gxOHR2UEVTTW5nZXZPd2J5VFE5?=
 =?utf-8?B?YXZFMGdNNGR4YmFTUmRpSjNZbVRIN3FMdDgzNEY1TXR5b1NzMUptWVFMRTJB?=
 =?utf-8?B?VXVsdHNyTVU1eG16dmV1VVRSMVh0ZmdqTnpnZC9DSkZTV1FVSDRmUlNLaGZF?=
 =?utf-8?B?T3Y3QlpBbTJnVjJWbkdEKzVWWXo1aVg5ZENSRERLdGhvTVlZY3MxRFJ5VEE5?=
 =?utf-8?B?dTIzOGlkaXpLS2lHWDlPcUhnQnZxanF4YkRHYUpJZU5uZm04UlJIM3hOenN1?=
 =?utf-8?B?T1FrZ291K3cvZkZhTjBpMEkzaVBFaHNiZEJSZmNSODM1QW1lUDhEclp0SnVm?=
 =?utf-8?B?U2I2ZDJFcUxCVXo2R3J2TFRpeml0cHEyTDBPa0ptbHd3RUVpRkp4UTI4S1k0?=
 =?utf-8?B?bzBWSnhtYlBLb25XZTlDWXZaUG1PMFpmb3dFTDRNVUY0QVN3STdJMDlHTEIv?=
 =?utf-8?B?Z1I4MVNYMTROYVg0T3J0bytCY2tSWVEyU3hUWkZkYlhiN1lWckROUWJ3djBF?=
 =?utf-8?B?dnNlelBWTFNqSVJXcnljYjNpNkNaOENldmtlVXpoVEZYRnJLVk1HZmdyRHhu?=
 =?utf-8?B?WGVlRUdmUUlPZ2kyb2ZsM3Mzb0xSTE92UlpLcTI2UnNZRk1hSWYyUUczWUdV?=
 =?utf-8?B?aW91ZXNHSWp6ZWd2WU5tRFVEd1oxamRKalVvOVhLTUx0RWFEN1liUW5zMzBs?=
 =?utf-8?B?M0xDTnlOQU9VbFVjZVNXVjd5Vk04cDQ3Vk03TVI3VXhRQ1lIUzFiZmcyN1lJ?=
 =?utf-8?B?VlFKd0M0bm1vRHg1S2t5djVJbnd3V3locCtwQ1pqMlZVVytkK2ltQVMrOTdm?=
 =?utf-8?B?VkRvMDdST2MyZ3oxa1JhYmhYU3FNb1JjRFVzR2JoV2YxZzIrYUMzL3BJM3JO?=
 =?utf-8?B?TENUY0p4Q0FHNlVORmFXb3pseUVxRkthd0U3c3lqKzE4RFNlUzBwZVRYU3p5?=
 =?utf-8?B?M1pibFdzb3c4Z3RJVXBjbitGT21ySXhOUmJON2pCZ21mMkgySjBFb0FqR1Vp?=
 =?utf-8?B?V3p6dGgrL01LMnA2YUFBVjdYeCtiVUMrNy9ydUtNTFRNcXFtdXhWVkl4YTRY?=
 =?utf-8?B?VnA0VjFXME9CY00yOHFkb0lWY0pNclVQZytxWnhTcjNYcnhHTXRYdllFdnRn?=
 =?utf-8?B?cE5mWE5mVTNwa0tGS05LS05kclNsajZEWlhtNmdzdkg4eVQvUHdveGtZUWJv?=
 =?utf-8?B?YVNaS1QrVjdoajNQOEMyWW93c1FGY3crNXgrOXdLbG56WktPK2h5RWJMUDd6?=
 =?utf-8?B?cUtBUHVVVkZrSEhpSGtkdGFZZ2NZK0FwU09LV1NmQ2JyVzVsZU9LQjJBMlJG?=
 =?utf-8?B?bEorbS81T0tydktDWjhNQ1BmVEhvU1pkaDJHZXMrSmU0V0ROTVNEcUtRQVgx?=
 =?utf-8?B?N3VKenVBVjl4eDFFUFhJeDVnZ0UycEZFdDJ0MkFZS2N6eFQ5TGErQ0lHbTZz?=
 =?utf-8?B?VExzckRDRUp1TnRjdnVPZDJ3SWEwUTZwQ3Uwc0I3UWpIbExKeXJ2SnJYOUk4?=
 =?utf-8?B?dUt5eXRmYldFcEJqdW5hVld3T2NpZFVkSDlSUEZXMmd4cXZpdlA4c1dMcHpM?=
 =?utf-8?B?MEVvWFp3cURwSHl3aHJabnlOcU1wRUNvb2Q4eHh3VVlHbEVER05TN3VuRHl2?=
 =?utf-8?B?Mlc3ditUUjRXU1Q0N3pTVzZ0RjkwOCtvTUtEd1BuMk40RjQxdkhDdk1CZUVB?=
 =?utf-8?B?ZytySVYyU2JIQTZGUXNJUkpWRjJnKy83SlpXZEJvTTJZZVZYMmdka0U0RXNQ?=
 =?utf-8?B?d09IakNWd0xyUUdMcUlGenJHT0ZZQ2ppR0VTQ3B0YitYcmtodnpad2VSUlQ3?=
 =?utf-8?Q?Py1okM8izei2fkQAVVFuKoKiSh+hhsJCyXzMl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04185a65-09c5-470d-d522-08df09c564da
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:12:31.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +M9gAt+odg6aP13XRmXY+idmrc37e3nOsIEtMDMSVfriyus2/nc4EckwG7tf7e4rt8xKPmqcakVoKfXUoxpWXb1aVMh3KMxSI+Sk7D+GzWQfLQzjcwXiY/nakWwMS81u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10303

From: Peng Fan <peng.fan@nxp.com>

Replace the if/else pairs of __set_bit()/__clear_bit() in
sdma_config_ownership() with __assign_bit(), which does exactly the
same conditional set-or-clear in a single call.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/imx-sdma.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 63261ab6402b9..da565409beaaa 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -710,20 +710,9 @@ static int sdma_config_ownership(struct sdma_channel *sdmac,
 	mcu = readl_relaxed(sdma->regs + SDMA_H_HOSTOVR);
 	dsp = readl_relaxed(sdma->regs + SDMA_H_DSPOVR);
 
-	if (dsp_override)
-		__clear_bit(channel, &dsp);
-	else
-		__set_bit(channel, &dsp);
-
-	if (event_override)
-		__clear_bit(channel, &evt);
-	else
-		__set_bit(channel, &evt);
-
-	if (mcu_override)
-		__clear_bit(channel, &mcu);
-	else
-		__set_bit(channel, &mcu);
+	__assign_bit(channel, &dsp, !dsp_override);
+	__assign_bit(channel, &evt, !event_override);
+	__assign_bit(channel, &mcu, !mcu_override);
 
 	writel_relaxed(evt, sdma->regs + SDMA_H_EVTOVR);
 	writel_relaxed(mcu, sdma->regs + SDMA_H_HOSTOVR);

-- 
2.34.1

