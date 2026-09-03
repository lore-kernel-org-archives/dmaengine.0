Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300814B2CBF;
	Thu,  3 Sep 2026 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444777; cv=fail; b=MgkA44c+ATBnmwG5FeGrO7ZVibHrMcKa5Bdx9BFEN1xIv69hXYmvbOpeEHY6S/qyktbua2pjq7XrgE8MvklzHGZ1zTGUN5Ir2AU7dRakqmD73XTfsIp1txicSLHlq/LoG9QLjUzpWmORIFyQ3h1ykBq4lNwz/IjGtMjG4aAtXdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444777; c=relaxed/simple;
	bh=iRhtYJhVU5mDrPdCaboPA0i4Qcw41Cn9e30Dqs8mytA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gZeRNdy8PVKrWuyFvk6xRNHTRwA446zBx4PgJGTiEMg8zHomaClDpTarElVf55FR2ifRyoqrlWc2CF1iGGK/inKlY0amFt8CqOnZhkFmOTi8jKY6adW2cQGRzLqyj4WqZvL1Rftw0Aunretrs9QWwE0cwEhpEfpUI2X3yxHmvJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rBcqUtu5; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rBcqUtu5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sew/XGN7ZeOCEjMUb5Ll0Dvga9Zt3WLXajPqYK1AHp+FisJvvfnBDQPH3xPKMGsLESeibRVyHt1SIuQJewTUwn+PvocvyTzkuM+0wq1BzlRlu4vmrEWBU5fE30uy5KUGxCMQudWLx2LYvswsBxafgTbn0h9hsBdODw1Hl8y2smEtiUusU/tUoE09itUnATkhEQxl34O07ZgkJiiHCIy8VWUekNUr32W/QqnC+WNHEvWqxiEVv0SYtPt/qUP4VEMOgKT1EtRx1rV418r3wVtjlEOd76KTsbw7XcmzZAubp7z3uE5UkMo8tbyvXDl925qnoNp5tvuDaccyyHQ44vUDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKKoEue3iySrJKJk3Ab9v/2lGmJiatJEz9wx2Kff+ss=;
 b=SQZUoqsp418DFsGMXpkGV6atlHMOfLcdu7vvvu1nSGCkyA0AM2lsWCtgf2IWoQyKlXaCJPYFuBV4N2fiN1LSLL6fnEbFQxTj8fu9cw8z6jnR4J8RLu1yTDB3cGYU7+le8Anpw9pJtEQG0PUC3ZlxBSLb9QhOnpQ8k/DJWwZJxzJBEEzjGZRnshPwmZQ5azdam7SaAjtVvRIUVbfRuqX1lq76c3BgmCWbX9Zg3rybwGhp3Ci0yhXLpSPjQivFO/1bZXtNxtX3rH9bHpmY09lvlTxgFwkBiPjtZ+26QSvTdGbJlLsZCS9CQayEAWPIsqBE/odPzciKegVMyvuMo5HCQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKKoEue3iySrJKJk3Ab9v/2lGmJiatJEz9wx2Kff+ss=;
 b=rBcqUtu596WTwZOzBdwIa2D4wH1GkA6IlRF1NCTcvjLinl03YnpbT4E+0F6alA0n1meUHagcOXQJ780hlKKLotTTkmhHY0K4oAvjdB6yjMjg119oscmm19b+RNIJM3lkyZA/xWg/cH+CuM9TG5i2ggb/LCqDeiM8snhzcmBefSDz89aBaeH90Wvf9oasVeAJ8eiMoHHHyh8qov15CKVyefiTDUkSHNZw3W5gxCmLwBwa/mNLQR+ayTwkPelN2KyPtpJ22/9B46A78DouAxpP0aHEfECA4Enl8XXkLsCcQGl7FWGQx9h/1+N1yITerCRLRYSfxHOXfnVlWmMjuXaeew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10303.eurprd04.prod.outlook.com (2603:10a6:150:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 14:12:25 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 14:12:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 03 Sep 2026 22:16:13 +0800
Subject: [PATCH 2/3] dmaengine: imx-sdma: Use non-atomic __set_bit() for
 event_mask setup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dma-mask-v1-2-211ffd12c236@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0250.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: 1933b703-b139-409f-68e1-08df09c560f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	CS4iVgS/R9BMosQjSYjrqAQCofC+mW78kcAqXoWbgVBi6rfFEKh3LqdI8K0QmvNhulpMjVr/21JQKaPJ+kuwJEK0gCXWaPyvZeSfbbmJ83K0OU2ZbUx0mKWasvk3d/dz+00pVn52gQUtolLsbblQDBXHc4xREJHuUEyksqTwW1conMQ+u9c6HQ5/TIsBbNSFd1rGQKrEPY4Zwse6ZWkFp6zpVre98pTGpEOvDcflJ0EAsqcTlk+2TIkJSldhhSi3jTvYOuiKlx0vMX18yoo/f6aMGzMSGrrCQf67xQkQDnJuHRKv1eywasO25IGRX4Ea385JnEi0K6M4MU0Ajxus5oYGrkZ88HCIpr6AlGlfbjhDHJyv7ZHeZPcGWtquzs5aJ2ggOvNIoHOvCHj2RtvfJRHv2OvFawLWA9Fkygy1BxcqiCddahEPvLEgOSSM3Jo33jdn2caI1rdImidVvkz7/JGtgMMTp8zSLMi8LJ3lW8e4R2L9QxiVV8PaJ5Xe768AHNIq/KqUarQoJOGLoS0a4le0m7X00c6nUNEpqOl3Zf2fUGJtTnZLbGeVMN+DKTTozoTfgTemVH3TgVnkcs6I3H3sR57Lxn84X5R4MeedWAa79c0y9VmT3H6t+nm/50xRTqfiSs1ue00hOFx+07iJcG0boOqfB5YVBqWykdbQodk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2lhZVJxTkJiZzNIVzRBaFI0bVJQNytMKzdzU0FVYU44d3J2amljcGRXM0xx?=
 =?utf-8?B?dUl1cFVGRm9VTVlaTDV3T3I1QWM0S1VwTHkxelRTaWF3dWxuNTJWZnkyQi8w?=
 =?utf-8?B?TGNpZUIyVzEvTzlYalZrTEFoQm0rcks3Tk9DYlFjcjMveEdQNDFiaWRMdWV0?=
 =?utf-8?B?cWJzSUNPNE5IK2Qydm9FcTNEMEhVdSt0UlVuNXM1cEpQRE5YeG5VUkJQcmVS?=
 =?utf-8?B?T3crOWpXYy95Uk40ZkhMdDM3Y1U2aGRhQzZrOCt0UGI2WWFvaklhczAvVWtz?=
 =?utf-8?B?QW4rTmxnNzg3QnF2RnpkQU4xQ0hQdGliT05peGhwQktUanIvYUhNWW1KVWNy?=
 =?utf-8?B?QXRpUDRITlZjczI1dElpVU5rQXpILy94MkZ3b3JhL0NoTHZrLzMwMC9ybUZt?=
 =?utf-8?B?Zzl3WW8vUUZGaFpsSVl1bHdDNlc0RytDdW5MN2RiQzRiUUdjanZUK0kxcFFj?=
 =?utf-8?B?L1JZbWZXNEtTN0syUndtTUtTUFZOUEQwZnN6YWprTGJYSVYrbU5QaUloZHlO?=
 =?utf-8?B?R0REVldvVG9UOS9Kc1RBT0NqYzZMREljMXdOZTRibEdteHcveTJTdFJlcWpi?=
 =?utf-8?B?ZjcwYllodDdZSUljalcrd2hBZDFCNTNBUWhDZlRjRlB2bEdYYnBNTG04SVY4?=
 =?utf-8?B?TjM4Q3dxNkdUbDBMemwxNnE5b0NUK2tBbW42UGZvNEg2ZG00Z1l6MHdZN0Zx?=
 =?utf-8?B?TG9zeXpEL3Q3Y0N4cTN2dnJ6U1Z1dS93eTZmN3pqUk1zWEZJaVlYV3p5M0JN?=
 =?utf-8?B?ZFl4QmVDclJYdG1KbjVncDNTWW05M3VZWGNpVFcxV21kWVJJanlBOTV0eXNi?=
 =?utf-8?B?OENsa0U3cnBvUGZmL3dFbmdGNkdkMWM3KzN4WUZzdFBiSjRMeSs0V0ZIM3Zm?=
 =?utf-8?B?ZzVjc04yMnhrYlpOaVFLWGoxOE1sRHBXV2dhMjJqcUtScFYxcWpBcWNGTU93?=
 =?utf-8?B?dGppeFBmQTZYMm5QVjRGdVI4ZWJFTzcxc2pMelN4Y1dEbjd1QUJBV01FMHhL?=
 =?utf-8?B?enczNWVXRDNrMFBsRTVkWHRKczRWRFNqMHN3K2tEdS9nTGFmVHEwS29HQXRI?=
 =?utf-8?B?QUJFSWl5cEVTNGVJb0tTZlY1dlY5c2VvU0l5QzQ0RlRxSkR5UlJBTGZkb1g0?=
 =?utf-8?B?VkhxQUJlQ0x0VUxuVnFlb0NtZllTTXZNZDBKNFJ6TTJzUi9PeEFpTkphdDJR?=
 =?utf-8?B?OUV0L3BueXZtOTJEWWc5aU95QUxLQ3JYbzBMS1REVjM1QjM3V3hBcVJMUFl2?=
 =?utf-8?B?TkxvUXNueEhXQ2hXc0kwZXMyKzlLcDJPeUs5emtSejNaVGR3dUZmRHlsY0JD?=
 =?utf-8?B?d2t3V2V4VC9TMFF2TzBxNWxlY0o5eG5mSmFnR2NuR2NQNCt0QzZ3cE9RLy92?=
 =?utf-8?B?Yzdsc3ZwVlk2d28zLzhrWCtwRUJNMjhXUHJ4OWs3UVhFbnZmb01xblcrNjFZ?=
 =?utf-8?B?ckliQ0ZGL0xlc2dld0xGQzA2S2hlN01XMDZvVEJXcmcvazVuWGwrUVpmcjBm?=
 =?utf-8?B?b3lETUwyTlJsU2JiY2dtVWdMR2lQYUk4K05GQ2h6ejJBa2dxREdCeitpSHJz?=
 =?utf-8?B?TG9KWkprcjNaWGJvSlp4YnBPdXRIZ3ppeHBMRi9ONTN1aWUzQS9WT3pmRy93?=
 =?utf-8?B?TlJzK1FFTDhRRkt5dEM4S3p4SCtUbmNDSmhQS0dWZm5XM3dpY2l1REpBSkdT?=
 =?utf-8?B?Q2lHQTI5a2VGTXRCWVdya3NBa1lXL2RsQkIrbXgvSXBOSzF0RWRORjc4aTI2?=
 =?utf-8?B?bDFBZUxicWU1VXFMRXlkTjNPRTZLaXZnVFVXTFZQUFpJcHJKaExGK2NQc1du?=
 =?utf-8?B?L24zQ1M0TExMa3FJQ2xyQk5oQ3JCSVYxNTlmZy96OG8yamJtb2hEMldCaWVN?=
 =?utf-8?B?Ukpvcjk4TE9DOXRLL1lNTWl0dDFaZXB2aHhzUmNXSEViRnB1ck0ydkxaUklo?=
 =?utf-8?B?cG40cWV4MEJHWGhqK3NBME94eXk0Z2RlOU9XMGFibmoxQXBONjg2aFNqdDdF?=
 =?utf-8?B?R2JtR2Y1enZjRGl5RkZDOTdvRlltVU5UWE03VFpmb3c4SGZaZVoxbk5Gc3lM?=
 =?utf-8?B?OUxSbG05anJEZGdpbEFOY0d6YTlaK3A2OEhiN2g4OGlXOStWQzBQVjRaVDkv?=
 =?utf-8?B?dnZHejBCQXZVSkdNTk9UclMwcDBiay9DeGVjNUlCWDVYMU0wVGtWTGUyMFo4?=
 =?utf-8?B?d0JOZ3k1ZCthYVN0bzlGejlqc216Ym9EQXZhbUFtNkR5VjdUcms3dHd2Q2px?=
 =?utf-8?B?by9LcndiS2dkRDRVK0I5bW05MkE1dzVJZXdhRWluMjVJYUhoeEVEVmFzYnl5?=
 =?utf-8?B?QU9oR0dob2xkQ2ZacThJRTRSTCtZM0lBU0RkUXFmVUVYRU13M1NCS29aTjNz?=
 =?utf-8?Q?yfrW1q0nsmgvALwwinjGxkArUvdFfKlD65FMn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1933b703-b139-409f-68e1-08df09c560f8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:12:25.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NV2y+7euuQSfb6FzFWGJHObZSHvWGh4oSUQoZBRqNTU57ONdEQLN2+Yk626tzxFIcaOpOkNOjHDK3BMO77Tg0PvIj/2te7dPYNGjerkNV6vwzFgHhcA41ECU4P4A/6qp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10303

From: Peng Fan <peng.fan@nxp.com>

In sdma_set_watermarklevel_for_p2p(), the event_mask[] fields are zeroed
in sdma_config_channel() right before this function is called, and the
channel has already been disabled. There is no concurrent access to
event_mask at this point, so replace set_bit() with __set_bit().

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/imx-sdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 36368835a845c..63261ab6402b9 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -1241,8 +1241,8 @@ static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
 	int lwml = sdmac->watermark_level & SDMA_WATERMARK_LEVEL_LWML;
 	int hwml = (sdmac->watermark_level & SDMA_WATERMARK_LEVEL_HWML) >> 16;
 
-	set_bit(sdmac->event_id0 % 32, &sdmac->event_mask[1]);
-	set_bit(sdmac->event_id1 % 32, &sdmac->event_mask[0]);
+	__set_bit(sdmac->event_id0 % 32, &sdmac->event_mask[1]);
+	__set_bit(sdmac->event_id1 % 32, &sdmac->event_mask[0]);
 
 	if (sdmac->event_id0 > 31)
 		sdmac->watermark_level |= SDMA_WATERMARK_LEVEL_LWE;

-- 
2.34.1

