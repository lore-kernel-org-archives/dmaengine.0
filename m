Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8749F4B26FD;
	Thu,  3 Sep 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444767; cv=fail; b=r3QDx9zInNQ4nMlOslis2LHrslwfrweXp9JTNK3hc0aLN3aQiwTwKANKu/dUYH5Ooy8IuUTGWMBgahkEodTlCGYD82W4t+jZDRu7kczV2XTwfVMB90HRFlrL+mzGl7W7k4L+Snx+DWyd412hZ/fh0vNnuZjNWUNgs2bqNB+7nzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444767; c=relaxed/simple;
	bh=awaosdMdLtxilnEPjIDNdr7O6D3KgmZLgTfPEMFUr/c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DsaAoVySeVxLwNIVMbFVIJrSl9js/FOtYt9yGBq+u9JelfEwn7LPWbaWgSOsILw/A+eUBUDIZsXh9mWoDw7K+KnlbqrpF3dazuYGiKK9CBhX7RkINLbhQp2iAoItCGlyomUqmkbqzkDD7AoTMCyXT4/xImppttt3twYd3db55s4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U5g5akrN; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U5g5akrN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2i3QtwH2QwJDjsSot6Ec1xhuGvnW/wqxvhLFlBJ3Me7m6RTxtvgoP63ef/Qghz3l6kB5HYtfub31BQgY+ouG9eNMbYlGFE8gjQF1gOyvL4kfsydMc5wNP2SROqVSuSy5ejjFgcskTfQS60Ab4w+mamKFw2BblWjdLCfFFJxa9/Aa2Hrh/497Q4LaOBItKfoYGJCPZ0SS3PtS9IMjz8x/Qs3/aodd46tfpIxLGb0uELYhRWbzy1lW0pVnccAQM99UMKZnM/wUXTVXjaxQpTTxepgpOHMbL99csW4aE4AvMeqyM9dsks/xjMhb8riTL7HVcwVo88A6IKZE7EjgIBRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SETl6Zx/9u4i1IAJpMElJhCxnzeSxzb4CVUFepiGZ2g=;
 b=R6dvAJNyhcCOShRi8+Bi/IrOQnnU2dK16kuQFJ6Za6SGePCwa1mcidbPxGMg8mV6h8dlWgWTDeYzNFk8kz1buPHCpRZj1wqmwwSQKldMVw8L06fIUjX+l+4eLy/x1oIeYgAZBAqr+jkfad19QNJaR/BGKL50BCcnYPew5RLfSBdtkZeiFmeqOyzGSvCV8+22VjqIt078NvYgByGFsPcmgHmFP4pfaUuqNHjdE36LM4WDFA5kFw2H62ai1e5wH6dAkO2sRhigEGQFC4EKiZF6SCISPbACXOzTtNNJn8QcnwC2rulA7NT1laABU+/8y67z5SDdMRkKN4XAvPZVGu7HlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SETl6Zx/9u4i1IAJpMElJhCxnzeSxzb4CVUFepiGZ2g=;
 b=U5g5akrN2S9c7cBuUxkqYztjPgEVS50RWaOnuvISTtgfgxDgH7rgG6UBb2ilIcAzfcs9u4jwIiojbtkm2Yj/KMqRa+WgizblL0VGVD3yW15dtBC70LwZCbrDYQzCffTt90erQingVFAHyMMrh7VnTQSivsxaEG46Vn+8vocvsR0NnjMg1hBCVW+LbODBsbcrFn6Vz9Ie71sVAodb5fxW449wqMaABzr/WLpnrjLnSalFh5/80OKOnMq/yM3AfetmcMRKVEWr2eYm+Ddo7RIRoSI82C6V9lKPQHGrvppzvsbupnKwfgUxtaS3Xo9GGHu146ZSgwlcxvjRhs6Xl40Frg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10303.eurprd04.prod.outlook.com (2603:10a6:150:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 14:12:17 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 14:12:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 03 Sep 2026 22:16:12 +0800
Subject: [PATCH 1/3] dmaengine: Use non-atomic bit ops for cap_mask
 manipulation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dma-mask-v1-1-211ffd12c236@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e25ee3-c5a9-4453-d1cc-08df09c55c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	vUj8N1lfIQoVi2svn2DBB6LlUT8K9mZsssuDaOb5qEzQ8AZxdt/1LjjbcpjvpD1iP6IIiYKHuLdq7lI6U2kEWOqHH4TMQ+Kv+qRC55e8jT+gZ+NK6HJasLuiOzKadSKYT8US2R0SCfPUmvjNqCBR68xcyifnZX4uJOXHtqCuQaDQJzrxXEcCJxAjKi7bLqBi3Ooq75KMDau7WeqOENY5Hm75ZhC0JPdcQTNv5GPLeqBW1yQjMNgORbZlmRo3UPhc+m8xdjs5YIQpq2nq5lekFxuZS2NANRNTPx7XzxyVzM5whlr4mHHbablLP5MjNbOrCTuDgSv+qYSCE0Hs+edK0gw2VrGsXPoskyukZL1xTOV++sD0aUc7txIUSIa5LcwiTzZB2iwIkImODRWrMfZnXtblw+Z4qit19Ih6UGuiAHT9yrl7AwGNbnZyFgSXO17qD9y40DIT/xhhK1ebv61kEHbptsQeDIi6ZVrv6Q4bgG/c1Qhcv4F24WEV3Yt3nkgsNCbaJCKMKe9XhUK/hDiy6llEs7PrsASN67MkXlqNyef+V+NZYiw89Ym+WsW2WJHt7ZzC5aDYeQBAH5fB/xGhc+iDihksDFvyGGhWklvBor5UJ1bjXRKOfjx56J7dVP4XCu5zNsLGNncBsnDLyFIJgarNDUuEMv/yELXjTz8ksRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmk1RGRiZElYczdFTEIrbU11NlNVREVGSzBNeXMwVlFRR1ljdWFGQ1ltWXkv?=
 =?utf-8?B?QUlyTEswU0hzNzVjTG52WjVkQ1JNcVp3bkcrV2dzSHRHYmFWZUFhSkVSaHVX?=
 =?utf-8?B?RVZOeDAybG1RVE5rT2xybDRSOWk0VmUwRTJPb0lvOFpEcCtNcFNoOW5aY1JN?=
 =?utf-8?B?MkJGTVhOQTJMdkpVRkk1Ylcvd2VwY1FLaTFQSGxLTVVhUkdGTFRiREJCRHF5?=
 =?utf-8?B?aE9IWmlQV0czd1RGYTc3YnJtcnFxb2JZQnZ1UnRtdk15RUpCc1BrTFBlajJk?=
 =?utf-8?B?VnVmYmlSck44UXBrb01CVXJmZDlXTHpwYUprUVEzeEtjRW1EaWtkWWU2SDFD?=
 =?utf-8?B?ZXZLazRpbFRON3B5ODdSUVZMSlcxcllDdW9lbVJ6czBLTkdCOFJVVTU4M1ZU?=
 =?utf-8?B?YnhRay9IU2JrSVZGcHpKVEsyc2pkMElHRHVjMjl0R3QrQzhDbWNNT2Q3UXZE?=
 =?utf-8?B?a0d2S3pPSlBLeFlwOXl3cERTZ1pSRkFlVk5aTFhObXhqTEJPempxYnc2cWVs?=
 =?utf-8?B?eE5BRE9BTzJnRkRXOGp2bFlST2xFMUFiWHJ3c0J2b1pTVUQ4VWFrM0NYV2pk?=
 =?utf-8?B?M3JxcFA4WS9ZbjRGVWZMRk1xdkowTERRVGFVQWVXcjVDeC9BaWk0L2R6alg3?=
 =?utf-8?B?Ni9Ca1l0dUJoK3lDNEJiejNVSXJqeURMNzhxcUQyL2N1alB1dDNjS243RUVn?=
 =?utf-8?B?UDFpUWV2cUpSb1VxYlZkZ2VpRkN3SFVnckpySTRLeEIvVGRBVTI4TzZRREZi?=
 =?utf-8?B?REE5eHBneC9RakJCRXMwa3hMU3g1Rys0WXkyYytyeUZzZDE4MVBneDVUZVFw?=
 =?utf-8?B?c3gwdUpkR0E2eWZCZlBUdzhhRmY2TnJ2bGxQRnNuMGJibDhicXBLUzUrNElz?=
 =?utf-8?B?Zlo3ajhoSnlzczFiSHByZnBhNTg4VmZxcVlXVnZ3Z0pLY0xXOHFKWVF3WUs1?=
 =?utf-8?B?MUlHa0ExbFptYkhndSs1R1ZvQVNHOHNsKzRQVUk3VEM0dGlTRlhMbUswNnlq?=
 =?utf-8?B?dUVGZS9NMDRoZnFXUzlMaU5Dam9kdkRzOVFOTlZSVDZCUk5pN20rbGx6YVBs?=
 =?utf-8?B?WmhLKy9nZmZZd0MyR0NxeG5kay9SQ1RrUTdoM3BnYm9vQ3JOWVdmY3lhSlRD?=
 =?utf-8?B?RmpqT0ZSUFQySDdXcHl5OElRNlF5Q1NCckFZOVlHMUJsM0tXbnlCcVdqQ3Z6?=
 =?utf-8?B?S1E4M1RsekxHZHdqRVZnU2JTOU5FZHd5VTZDdmJtWHJNL3ZXR3piWkMrYmEw?=
 =?utf-8?B?VWRCays3d0UyMEV2ak1MbU5oaHYyZTRBbVFXNTFoRVRZTTJkT2NpY2lqV2hw?=
 =?utf-8?B?S2hweURmenVPWEQzcDBSUlBXc2pFamp4WXYxWitCTTVvZmowalcwZ2R6T01R?=
 =?utf-8?B?eXJWUTU2VzREdWVuS3dWaUNrUnNTdDlEbG5lZGpaM2JOMERzTlNocGZweS91?=
 =?utf-8?B?S1JkdmFRTGpRbkdJSFNDMHlhWEVJQnprY05NYTFsamo4MTFuZ1kydGNPbDZW?=
 =?utf-8?B?a2s0QjRWaTJOemc3aFdIK2hkcEFYN2dCU05xMU9ITE1WelgyZFFnN2xHYUJj?=
 =?utf-8?B?WndCV1JwejliQmhvWU9qcllHakZic3pyT21xZjJDeVJmNDFCUTRPZUcrSWFu?=
 =?utf-8?B?ZVdUamFZdzVNUFBIQTFZQUlSSXRrcVN1QVhtYkVkYXpYMXZ2MG5DUlRoZERy?=
 =?utf-8?B?WlBWekJuZkVEYWpBWHhSV3JWdno0d2s1ajF0VFdFOXNza2gvNXpSRjNiNlo5?=
 =?utf-8?B?eHVoRlNSTGNPM0hVUVVaY3lSQS9STXVqRDFvekZkTTBVcHVOdEdVTzF6QlQ0?=
 =?utf-8?B?djZocXhqK1VnMDdCK012SmgwalZPY09YY1BUODM4T0l6N2R5OHI2UGY3MWRC?=
 =?utf-8?B?bmljWllqcFdtREdXTkY5NVcxdDZPVElLWlRCNml5UjJTWUlGdTJpU2ZVZVZF?=
 =?utf-8?B?Y1hkNWREaldXbXRNUkZJREJNbjNoaTRlL1hZWkxlL0NKdWI5d2VydWt3anRQ?=
 =?utf-8?B?ZlY2YTdEcE9iM0F1YlVjMTVaSFJ2VWpFcmZKM1d0eEpScGZVMXg5UVp6TkFt?=
 =?utf-8?B?b0paWE9vREtRMkx2aWU5TzJyY1dPa0R3WjB2N2tOME9mSlJoVStnMHJaZ1RW?=
 =?utf-8?B?ZFBHOEF2YU1WSjdHNUtiYVlkSTYwTHdtTnZaS0NxUW5ib0d6Z2JMQjJQZGRM?=
 =?utf-8?B?OW9oWEVhYi9xL2J1MWVubEhpeFlxcURORUM3TTJjR1hsQkhYNE1DdEZpTk9I?=
 =?utf-8?B?THp4U2lsZW8wYWdBS0xnU3UyUlhVb2UwWjZ6bnFqd01oSW5sdmR6SXQ0R3R6?=
 =?utf-8?B?aXJwOEpJM2tBVVkwdUExZXFMUG1GeCtmcU1PRFJkZ0N4VEhreVdWQnYxSXFr?=
 =?utf-8?Q?McfLsE0utPih2TKdpIYdwYaGcmpYr+cwPZvy7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e25ee3-c5a9-4453-d1cc-08df09c55c64
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:12:17.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ke9IbR21w8Gt4jMsHDhqqiiVG+x4VUFawsO+Xt7twOij+Mr4su29NHNb03T9pRFbMnN5ZAjXUFXve+Qxma2PmCE2e7w8juheel24y8yJU+WbnBJvWalCYPRlIKCzYy5i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10303

From: Peng Fan <peng.fan@nxp.com>

dma_cap_set() and dma_cap_clear() are called exclusively during driver
probe, before dma_async_device_register() makes the device visible to
the rest of the system. There is no concurrent access to cap_mask at
that point, so switch to the non-atomic __set_bit()/__clear_bit()
equivalents.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/linux/dmaengine.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index fe33a20abc614..923d914691d06 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1551,14 +1551,14 @@ static inline bool async_tx_test_ack(struct dma_async_tx_descriptor *tx)
 static inline void
 __dma_cap_set(enum dma_transaction_type tx_type, dma_cap_mask_t *dstp)
 {
-	set_bit(tx_type, dstp->bits);
+	__set_bit(tx_type, dstp->bits);
 }
 
 #define dma_cap_clear(tx, mask) __dma_cap_clear((tx), &(mask))
 static inline void
 __dma_cap_clear(enum dma_transaction_type tx_type, dma_cap_mask_t *dstp)
 {
-	clear_bit(tx_type, dstp->bits);
+	__clear_bit(tx_type, dstp->bits);
 }
 
 #define dma_cap_zero(mask) __dma_cap_zero(&(mask))

-- 
2.34.1

