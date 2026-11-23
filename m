Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795397281;
	b=dNkhNBvzhu4nvQSbP6q1z9rnPBHSve9cg100GYUshXiFSqB+PG7L1n0UcgpkKqNEpzTn
	 IhMbiu5hFiFCqhRlPUcIZ94bCDJ0kaYnkytbJFQIzs6xJ+aBtDkM7urFTfM7FGxWEPfUB
	 J70GLN+5s6NAxVQ1dqByweNC3aoZQbAPiLlYEeWglNc8f3KuWF/0oBengL2VTqIJ5vCE8
	 npUniCkdEkJpRrowDjftEJiCeA4Cb/r6AHpP7KV57w3akoSMdQ4lJE0Y7c337JLAN5Gyd
	 3eg4Q9n5EHnazaEm49iQpq1OrUa8OHXQ6d1w1dhGDmbPA461j8Tb9Zm4XOJO0sbMM2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397281;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ae6bwlTuudYGERs98XWGPQb4qytT4DEwkhzrvMre408=;
	b=C8LqSYWEhSgzbWphLPq9rImCxYJHrLGvnogeluSM7c3M4K8GXTiwtnlv5q21e4bcRBgV
	 rRNnHvaCnLdDyXekFtR/zWCYAOSxaUbeIsiNz+jKaFYtvk9l6/LIM5pmPYs88sIgg9SG1
	 scmrLMHqa3myVldH5B5SUPoubo5Y51F+hNXYwOFK/gwzqnrJIfqzfXgbJDLeU09p/3HLY
	 z1aMkL9Li12pf3yyGoKI0PrNPRYbuNT2qB2VDkyTuCj76SYEl8wAOqLqgBo/R33xOTylj
	 Ks6aB1O+RgXxGt+8KY27YAJtbd7EU0RQ+ke7ZBDSPzW1XWHjz4DalQ4UqDf0SavB4gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jrtsxh9n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.56
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D1606A31A
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 01:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jrtsxh9n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/5FB0RZ/wTA5bUkmwGPhmxLJdFfeAsiz7992wY1LGChj96gx+z3qRJNXxaAVjLLoZenSSegpwBMToxei9uDjOSiGB1dt2iLJICX59Y7kOK0PWKoB6vHIffPqRmXIK1o26mUj1rHMwfdIiFI9K0N9hCYVehKgHdXk50lC51/amyqq5dACeGao7P0DRhsncyGzMh6JX2YZ3QuXE5g86B4oedAIL5G8tXuylC+yCulJxWTF9Z3H/ucfnTbsP3aodt9ibW5AsCtR9bJ2B4bo1I4NTkTgWSuekwJoEO4wgutzQVDFR3v89hZGYLRaTEpRHeL5Hfoqgpho7VyHCvUClmjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ae6bwlTuudYGERs98XWGPQb4qytT4DEwkhzrvMre408=;
 b=jEKeToKHRNXVfhqhWnyO9thg6ugrZzl8mQyNA30oiFXiwQDlKsV12ZQELpRuzgSZe4Ji5ncSECmRhJhTCH2jIWfmFQokACl7c+Veu6DlzHTkfQ/GGQadScutNRLUuSFh1bJZJLT/VLMEbW43waqbxERdGn2x0JbooMKi+orKNj6Di1pR2ODvXPrtZ9om/8BMMLn7UOcEamrUF+rSP9x8OApGz2zkvqEcfKuh2iCggTeKBTqBm1DJggsPVSq88csXHhJr0QAu0B2PeR6mplJG7E2lbh5iZQrRri9i3Li5I/L8NN4VQ3RV11lQIay+ejCSgDwLGZ0lC2aUBq20VHfIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ae6bwlTuudYGERs98XWGPQb4qytT4DEwkhzrvMre408=;
 b=jrtsxh9nozVufFEKQXUNgOlmsjy/PC/DNni4ur/7hCNBSXfvmzFARCny5fYNoshUBB1HoCJ9sJOTCTBrv+aNFBN5bm61V/9MOcIMb1YeVSaSaiiBaGQQSyE8IcsvJQVmBcAuqxy1xxLgEQgXsD9+XfKjCdE3+dU8l0tIxOqarlQCO7usaFdYwN6WwCNfWs5uL87wUoBLvqumuBGFanbspKgKbaduDRF98vSl/lAP9Cy+C+tTGF1E8Dqz9dAKq2whvJWPx36JCxeWHG3C8DR53kmuRxWchBkjIeP/y4U8N74ekaz5NyPbSAF1Qh6kMyaanxVzErf9V5jA9b54zNaYrQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MA9PR04MB148417.eurprd04.prod.outlook.com (2603:10a6:250:10a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 01:27:58 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 01:27:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 23 Nov 2026 09:32:53 +0800
Subject: [PATCH 1/3] dmaengine: fsl-edma: unregister channels before vchan
 cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-edma-fixes-v1-1-59d5da374a16@nxp.com>
References: <20261123-edma-fixes-v1-0-59d5da374a16@nxp.com>
In-Reply-To: <20261123-edma-fixes-v1-0-59d5da374a16@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MA9PR04MB148417:EE_
X-MS-Office365-Filtering-Correlation-Id: e33dfe76-0383-40e4-405e-08df4901018f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	As+KdyX6MsMkMHMbMfsV6334QsB6BzZuIre7O/otXkfsE6Su1JbqB1GP6JkS8+Etq5f7H8rebJqFRCniaam2RTnAfuqPOmq//0MBY2XbcL0c+s5EpXQ9WLVDn7tl0PszVyp0P/3GYcNWLptcRO7aEJ70UXzYS2QuBDL2LjGJY1TQNdMhsHkf07WpYtXAvT190eS0Cc3Y1c80hce9E6NJ12LlbiGWgU4DMtqW/mueHGlRPKZJkX+dnSU79Uxv4etSsq+Qqta9R3B1Qb/zgblzq3AC6jjvT4ZELo8kSKHCag5PPsb0/NObV4ETeTorm/sHtb+19CaD2rV7AYXHLRRGH47x45+4+CFtj9awjWBICTM9b5k7o0DbKz8kdj9u2f8fnXBIcbzIqpD1vwbFPn4ATZFJHrS40Mqh3SLpi4uGlr+zsavWbOXlolG7L54zuvHmCsssXEkeQNI+2CahrXQcqJpJ0qKOTPm1LCExxOagjve8cSkSuGQ5jt3YfexVzyq5Co5pdncGz9NipZ/ZuppETLR01ZZPvXaTZu7V9jjjmq8tX7dEwheYNRo0rrofa4oDgLjlrpCjTwMrEPB52fMZHtTkmiIsoKHtX4ovZ50H7s6rEYWv9O0/9heNzLHGLZRQpkqcisx+5rm9gcjSJbSgm/d7UzvqKQ48QtM0MR6WFQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVJlakpEd25ZTXpPdEJxYW1WSGJ2TkxGazdYc2pjL1ZWK2NSKy9FRUtiSnhn?=
 =?utf-8?B?dmYxYUVxbWJiRzlCMTZUTFhsNDR5TFBCTWF0UXNHNEVTL0lyOG10anNUUDZX?=
 =?utf-8?B?bVliV1c3blJJeVRWSXlURmVxL1doSDBMSDZiWUdKNzlXME04T0I5cUJjKzdr?=
 =?utf-8?B?eWdrWWRFSmhQM3NTS0lkdXYwbDVMOTdqb3hQLzF5dkd6K3oybThLaUZxbVox?=
 =?utf-8?B?ODBoWGJFYmg1OEE1MTVZVm1yczVhekNzOGsxVzJYRnh0YmF0T2ZBeEZzbHZM?=
 =?utf-8?B?VTNlK0Fpb1NjS2FnMk9IVkhxSzBoa21FQnprVXB2MjBub3o5Q0l3MmpyV2l2?=
 =?utf-8?B?RFBSakNiRkdhRlIvOE5TaFpZazdReU1tc1NXbE9qTnBod0w0cWIyVmhXT2l4?=
 =?utf-8?B?MTlKODhyYVRtbCtkVmp5M1R6b0gybmNIRG5tNEJ2UklwdWdJdWpmN0ZTZGJX?=
 =?utf-8?B?cFRtd2hGWlVzUjhQT2VTZFBMdnR0QW1zQklqZWJyclorelN5Uy9LaGg1bXc0?=
 =?utf-8?B?THFFMXYrOG93YmUxcUxsb1lPUWtwK2RmU2llZVhKQmdwT3BGeGhlRkNBN0dH?=
 =?utf-8?B?cGVvMW05RktaM25ZQXZLVVF6d3dCMVpTaFNxaUxpM0t2VUgwa0NRaWdBSzRV?=
 =?utf-8?B?Y3JoRVZaQjRZbHlZcTBBNmkvN0Q5M0grOWc2ZDBydFp4dDZwM2MwdHVwaWFo?=
 =?utf-8?B?TEZuNmF1bGlRUno3cEU0U1p3Y2dEcTRDWGFVNGx4RDhIUHVLMVV1ZVczYnla?=
 =?utf-8?B?RFdUNVR2L3VTTWNuL1U3S1FBeHNvYUQrK2VqYjUxclZOcGdiZkIxdGNPdFF3?=
 =?utf-8?B?WXhOS2VLMkV6MVhvT3V1UHRIM09PVGZGSjVNRG5xOE1vQVIvNCswVTlyYTV1?=
 =?utf-8?B?SGpJdGpMYkJuYXJjTjYrMlhOUTM4SzVPMzJSSm4zVDNZdWY3K3Y5QWFjRm9W?=
 =?utf-8?B?eUhhSVVETmF4ZTlqc3NMamF0VWVueVhSQkZCTWhUSTJBcFFTSTFCaFBhSzdm?=
 =?utf-8?B?WTFtSU1mZGh5OE0yTXFRK1ZTSEo5dVU1c2FlN2MzVHA5TFZ3VW5iTmthM3hK?=
 =?utf-8?B?YzNzM3lvVzZ2Tk1YWVRvN05OZW5ROWlmekFIa3kwQkxtUFpSek91RkhKU1Np?=
 =?utf-8?B?MVFJYUFMeElwQW5UMm5BRmRJZWdCZWFteE1OWG1PU1BvSjUxMytiamR6NXVF?=
 =?utf-8?B?THZ6alNwejN3cjJJVzdNZFlDeTRySDdOYmIrRlNYWVorS1RhdEQ4TFZPUmR1?=
 =?utf-8?B?MW5iN2x3aEJNZmEySW5qendVaFc1ZjB0R3VjM3NsWHNIZGQ5dGdWTDNNV1NH?=
 =?utf-8?B?S002SHpaaVBEQ3dtT09CUWJpeGRZQ3l3V3A3ME1BUXlrZnNpdjdFamlzNXJE?=
 =?utf-8?B?MXlycEdIQXZXZlluc1Rta0xMMS82VktSYnhMQk54QkZYazB4RU5QMWlIak8r?=
 =?utf-8?B?YVI0WkozZE1HdDJka0hnZUp5cnh3OGtTTHVmYkhMQVdpUDJvVUthbDBHWnJa?=
 =?utf-8?B?bWNNdDVhMkFycW1WNk9lMVZWV1dsZG5Ic3NEUE9wYXpjTmsvUGFMUmM1TzVO?=
 =?utf-8?B?Y3o2R0Z2RlhqV3hta0JUMHRkd3FESC9ZNFhvYjlBbHNCdGhPRmRRMHVnRGFj?=
 =?utf-8?B?RnRPMVNsWlFBVDdkV0dIMzVnMm13czhrWXkyRnpTdCtWZUQ4aWt3QmMvRHQy?=
 =?utf-8?B?cmRacnZlZ2JYVVpuY0xRY2lWODdYeFQrejVCa3dxT2lFVXo2RmZBZjFReWdW?=
 =?utf-8?B?bGlVS2NNUk5aRDkyWE1aa2ZnSU5JSURadWg5ZHFCbWhId1FzdTJkV3RGd2lT?=
 =?utf-8?B?NzlXUGJJN0NqaE9mKzlKQXVwSWF3QUg3cjdhTXRVVncxaEgyRXZxY2M3bmlB?=
 =?utf-8?B?N1FWS1NlZ1NSajZ1Q3FSVDB4WVV5OC9VLzAyTWxLNi9BcXloVHprSzFUclZJ?=
 =?utf-8?B?VUREaXdhUS94cE8vQTNlMzBtTXR3d2FDcFhKSGkxU1ArT3hiOEZBWjluSFd2?=
 =?utf-8?B?RVFCVTZlS0dOREZUSzdXMHFhWEJUWm5wWVlmU2UrY0F2KzBldkdvQ2ZmM1hK?=
 =?utf-8?B?NE9WRy9zNkdUM3hSSEw3T3RJQlBURllJNWZ1ODV3NUljWDVkY2lFVExpQzhQ?=
 =?utf-8?B?eW5GN1N4MklDYStFMTA2YXFrdDJMQWRDbmVNWE9TcE9hcmNkcXJoSk90Y2xV?=
 =?utf-8?B?WE1mcmVuRm02MmQzTGxBT1dRUkNoL3R2bnpaeDFVc0xVdzE5N1VXZEpzUjlu?=
 =?utf-8?B?eTFpWVhRRVROaTIwYkVsZ0Z2QWx6a3MyVWQxendibklEdDVvWHBHVnNXcFN2?=
 =?utf-8?B?b2JYU28vY0JXRjE3NUd4eVVYVC94WlBQYlJaanR5VU1oYnRaRnJNRmdJaitv?=
 =?utf-8?Q?t6TYBb7qRoJSfPmT7U7Y4k/aXubVIEgThsQ/s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33dfe76-0383-40e4-405e-08df4901018f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 01:27:58.2944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMy2WEOJXjv2d3rcpBNidxPjW7a6F/WZ1U6yXlbi+ds9ui9S2yIRCJnQI6SK1LFKHwG5NmSftE/pbMwtcSYeEkpYLH5m2YXYAOttc5AkXOwMwSXJSXhFPmgLqSqZ/+Q0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB148417

From: Peng Fan <peng.fan@nxp.com>

Since commit 4035726a6b72 ("dmaengine: fsl-edma: Use managed API
dmaenginem_async_device_register()"), dma_async_device_unregister() runs
as a devres action after fsl_edma_remove(). However, fsl_edma_remove()
still calls fsl_edma_cleanup_vchan() first, which removes every channel
from dma_dev.channels.  When the devres action later runs,
dma_async_device_unregister() sees an empty channel list and never
unregisters the channel devices. They remain visible in /sys/class/dma.

Keep the vchan cleanup, but register it as a devres action before
dmaenginem_async_device_register(). Devres actions run in reverse
order, so the DMA channels are unregistered first and the vchan list is
cleaned up afterwards. Remove the premature cleanup call from
fsl_edma_remove().

Fixes: 4035726a6b72 ("dmaengine: fsl-edma: Use managed API dmaenginem_async_device_register()")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/fsl-edma-main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index da5139911488..7f82dcb7831d 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -31,6 +31,11 @@ static void fsl_edma_synchronize(struct dma_chan *chan)
 	vchan_synchronize(&fsl_chan->vchan);
 }
 
+static void fsl_edma_cleanup_vchan_action(void *data)
+{
+	fsl_edma_cleanup_vchan(data);
+}
+
 static irqreturn_t fsl_edma_tx_handler(int irq, void *dev_id)
 {
 	struct fsl_edma_engine *fsl_edma = dev_id;
@@ -881,6 +886,12 @@ static int fsl_edma_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fsl_edma);
 
+	ret = devm_add_action_or_reset(&pdev->dev,
+				       fsl_edma_cleanup_vchan_action,
+				       &fsl_edma->dma_dev);
+	if (ret)
+		return ret;
+
 	ret = dmaenginem_async_device_register(&fsl_edma->dma_dev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
@@ -905,7 +916,6 @@ static void fsl_edma_remove(struct platform_device *pdev)
 	struct fsl_edma_engine *fsl_edma = platform_get_drvdata(pdev);
 
 	fsl_edma_irq_exit(pdev, fsl_edma);
-	fsl_edma_cleanup_vchan(&fsl_edma->dma_dev);
 }
 
 static int fsl_edma_suspend_late(struct device *dev)

-- 
2.34.1

