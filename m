Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795031698;
	b=oZegyDvUhI+/fTcD/v9kZkNb4KGGUiWsHEIaKfcU8MSIyyQsYVlQhIFSEjzRwpndjUB6
	 NjRbrH3VURA0V9ecup2iZOxuIVXbejqnJy90P/wQ8at/B58TyQQ8EzivyX3tEQafJ8Na3
	 S4pLTtn712t/W8cTtsaH0VgFnsHEntlgsn4dYBt+00yunfMJyHz7t0y0b4BiBLWxNUO9K
	 ZGJG3ASuUwH/FtdQxx4rMTMkkHL6iDGxFDLT0fj+LSyq28hVJnMdnX+ZNkDPb2xOo+Jsy
	 h0qxqjiJQyo6ycCvdCIsIffGM2Qw/3anGmwsbZ+be8KGyK5si6LJGfDGXn40fbICEeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031698;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=JjMc+EGolz/MzgbY50j8q67RQZyzIjz8flmUPrsjD0w=;
	b=IfMJitzhLJrSoGlhLrRNfqrzvnhFMkha8mTi29jUuQditrpWreLZ3E5x55ARIH+bFcy5
	 7FE64aKEamO7uwh+iCoxPJObta0fL9zYqkPF7unKX3k9uixB+djkcTbcRECvMEKzY3Zm3
	 dcnduE2lPtJz1QXzBVY07kNPCq4OtqWOcQd154Uj02DU8wv2urDKuQc74JCdkzMm6whyq
	 yPwNnckB063EOQ/eur4uiCg7SlCCz6XG6w3B6qaFVWdEzBT8VWLZLG0bKf4x9pIjvBesY
	 G+GVIrO0ATEXupjjW70msba4bVWYmP0S40npmVjqBmLAdZ6/OQU8a+BE0Q9zog7ruyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mqZZzNoN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.46
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013046.outbound.protection.outlook.com [40.107.162.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58459606A32A
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 19:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58459606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mqZZzNoN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUjEP9HbLBKFTDBkAIuiV8CMKU78P4tSn26wNGPokaSUqLVDiZjdvdpPCy9r5uEUjSOmFhScMbd2pyLm/0bi18yMpBTQmcQjzeC+i0vu0u1P6nZeg3i78ykMj2aqAxmCFNOcAiEjwNlJUc2EiA1qtQhaAtu6VO3JpQ+yw/tyno+EhDnf43Z13F5xRTPSux8plfd7syHhVLvCkg4gezem0mbe3/2y4W0G5V1OtJNrH4DLSyKgc1J4iCAmPov24DRRS8bWAZVKVvtpXsPWFZR2XpZjUcunSYz2vrhtVn41zz4US6UY/WtFCLuqGJZu4UFo1OR9JbsmvPf4fXghn3NDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjMc+EGolz/MzgbY50j8q67RQZyzIjz8flmUPrsjD0w=;
 b=LDsqGsbVt3mmjWJyrtS7Jq7BmKD6ezW/3Xf/uYIDUHqxY3E5fxfMdmeTjdmg7ARzRtw7hl/N2C2VHJDm/QH6VAWiS+KOQjSwp/SuOnJtS/0B8eYDAMlutAus+EZ9paDT8xsLUbjz8Hmwr2uASAR8UwXvsUZwNbpgGlcpt9aUTmYaUh0M8vLwLIuqJ2PMcAhvL9odkCQmUevN98Zl5BS4CVBqyoPUQoibdzqRGPXzB52CsLPqttN698ZsLbv9fEanXTgjiRWE448oxgeD2GUf6IUOuYvi0CQ1nayoFLj/IKxonywETZCr2aEOa7Lw88MdoWkwtYoJ3G+bpSdJcfWVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjMc+EGolz/MzgbY50j8q67RQZyzIjz8flmUPrsjD0w=;
 b=mqZZzNoN+v6sKcHlNeHkvzJGYM+ywrByQybLrXST9R25AWsSU7TwTFMTRpwVJobwY4XtYayRlX4GWfVN92IE8c7k9BA0RHjX5GlmehxtMXEuo3z+OCI1EpiJx2wDgoSovpaHUsyQaN82hjSLf7+K4N9fe7vk+xyda2PUegDlLa/DTgVhP84uKCPZ1veaR1yXQgPtaLebLrEMNJT9K/LTYjtxNqwsHHroUm7/1X5nBmnuAMNRKeV6o7r4PXe4InCtVC3EXtysS1SsQ5j/k89PKpuFirr0e6TJ8ePDGgv3ff5fT5xoowGUZR5EZJXzUauqY02Ko1aFcSUQm6FE7a5J7A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB7893.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 19:54:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 19:54:42 +0000
Date: Wed, 18 Nov 2026 13:54:34 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: sashiko-reviews@lists.linux.dev, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Report the residue of packet
Message-ID: <av4CehTB2v1Bqp6K@SMW015318>
References: <20261115-qcom-bam-dma-metadata-v1-1-52e4de54ffd3@mainlining.org>
 <sashiko-outbox-215642@kernel.org>
 <7ac6f154-952c-412d-8ae3-b4e07a334ee1@mainlining.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ac6f154-952c-412d-8ae3-b4e07a334ee1@mainlining.org>
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: d260f411-e524-4de2-ba4f-08df45adc973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|261021135927099003|261022075727099003|10067099003|11063799006|56012099006|4143699003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OuD4gMhXAhYBHfs5jGRgehD4K712ZyXVPdJfqw0UN793ft3eH9ayV2yrLBGg1LFvZZqPd2bYtNjngOUFvPjTVN+n1QGON9RVYTpzNfz73+UuBrfAcemko1UVWE/Rs+cJUxyd/YgCHQ+0UgNMpSng2+7TqkFpZntPv5Ymh1b4m40obuzBCT0Xrgu6+81oL8mKJm6ntOKpQEZdNoTkPJg7dG6DwssIXdxcVzmrz7SfES62q/IV3TGD/e4vbJzczuNDCO0REdkrcRqqCkz9dlv/Iobv1flauOblPQbB4lB6h+B4UQ/f+JQTLuPgpLQm3U4VFpbqEHl9Q4GWrm4T/iYEQDwO5hLv3vj5yNiNMnlFzJ0usaR18S5ciCYSj1pC13ywn+rK/hw2Pircb9clxKTZ+H+SL92McQVq9uf4dG5spoxm4A5WPSAahTcDARjHh7UEqbrHZGcUdiXIPBOkeR7YIXPZp8/WcXp/I4NI5GPIMlfSZJvHTz7HQWofXl1UEYQuwBXjHBN4d6LpcqD6Jcr/Z79Hj3fr1TZ/BzpYR4BnAHw8ZpWtncmMtBmkhpqOL03vjeSiqyiGT5UA3NW5mfU85SlnEC7LSPByVN1n05g95OM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(261021135927099003)(261022075727099003)(10067099003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEZ3d3BDbmV5SUVEMjdtRENUbXAxb0gyUExSL05SeUFwNlQ1K3JlenQzSEtu?=
 =?utf-8?B?SEZKSjltZitTYmlCcFhaOHJhOHcrN2FqdHlSUjArbkRIZ0N4SWhTSUk0MWhL?=
 =?utf-8?B?eTdHVDRrcno0ZDJBTEpOUnY5VHkybnI1QTBhWjZxbUdpR3hrM0wvMHJlaDRr?=
 =?utf-8?B?L3g4R1RmN0J1SXRsTnJqZkVaVVUrcFpKWDF5aEI1Rzcvd0xiWmVZQkFsdkpv?=
 =?utf-8?B?ZDBKU0ZTYVE1TDZ5YzFpYUltOUxQUGd1OEJLUGNXQ3BkampwbytwOXg3TU42?=
 =?utf-8?B?enZQeUNJM2YyZkE2SnZMZU45YUFJbTE0NFZMVUlHaE9vODlEejhCVU4rQldl?=
 =?utf-8?B?SnhHOVBMRE5oNXZqeG9tb1BRSUM0Ym9WYS9tMUZONytDaGdSMVQ3VVFiMXgv?=
 =?utf-8?B?MU1sb0xRUU1yNVRkdEhkVXdPbnk3cGJQblF4TG9tTzJSNWVrTEFoQlFlaUN6?=
 =?utf-8?B?ZldGVXdFYmdCUE1yWTV5YUl3NXRKV0Vxem5Bc3lsUTVkS3FzOTd4aktUdDY4?=
 =?utf-8?B?QzZnWVNhRDlNZ2NEYTF3SDNLNEc1bnNrM3pLNG5NYmVKMG1Qd3c1MitwaHpn?=
 =?utf-8?B?QkVYVmdON3FwVXFMbUNQVDRxWExHcmNoNGFCcFp6WVY1UTlPZ3ZKNitSckVG?=
 =?utf-8?B?YkF5U0cvMjNoWGZYZVhMQ1VQVVVTUXFLMkszaFRWVmFaVEVjTmZEdVVrbC8y?=
 =?utf-8?B?aVlWRFFpVkRhZmp6Vm9rSVU3K0Z0blpublpVSGJEdzBHUDl0d2I4OW1FOGlh?=
 =?utf-8?B?U0xFU1BjSEVLalhLRjNXY2xqVmV5VWxlbXVQVEtQT3YzcDYrNnJIZmpVeExQ?=
 =?utf-8?B?NEZiSXhiSkVJNmNMUldUblFSeituWkpKNkdDWCtHQ2pUMVpwcEdzTWJrOFpQ?=
 =?utf-8?B?OWh3S3EyR2J4WnBob2NFOGNVTG14UGc0bUw1S2puaVM5VTRuYmFnaUVlQVdz?=
 =?utf-8?B?MStVc2d3bnNpcTRhNFhOaXd0cnF2QzFydTU2T3ZvTDY4aVFxYU5CSWJrdlkv?=
 =?utf-8?B?eEtVT2pzVXd6b2k4REpMazl6dHVJd3JRaUFmMWNFRytUVHpleXdybW5jY1hN?=
 =?utf-8?B?Y3IxRkc4OFZoU2loemRuWU44cWMyNStxLzFFVXJySkl4WHhYSFgwREltWjVn?=
 =?utf-8?B?K3NrUDA1VWh0aWEweHBGbVFJTmxrcVIzSjNLMU50OHZBY2VUVm0vVGZtOVpE?=
 =?utf-8?B?RU1uUXptQjVCWENlWjVHMW0zZWhWUHNYR3FyVFhndVVjNFJHMFhUYTl3VXJp?=
 =?utf-8?B?L0pyVFNBbzlKNzRuaGh5cTdqYUhydHliZ3JZWi9XQzJBOFRycG9aV3FySHJ3?=
 =?utf-8?B?d2NYMUk3ZndSRWVmdmpjNnEwcTlYeDJjUWM3Z0c4TnUzcHJoMFQyTjVScElW?=
 =?utf-8?B?bmZOWnBzUmp0SjVmYkFFK3NWVWdLMHF5MFhuTW5Mditsc21zOGtWcFVyM3l3?=
 =?utf-8?B?MlBLVnpuZ3ZrdzRzTVJPaGRyYmZwOU10SkRaMTZQRW1XZzRwNWM1ZGpNR3po?=
 =?utf-8?B?Nnd2SmxvM0QyQmRRWGlGa0FXZnNUSHBxRTZSRTdacm9haWFRdkxBRDgrUHhR?=
 =?utf-8?B?MGE4Q3g2WXVqZTF6VjZoWmVpa0kwc0RxVVlzQXg4OStKSSt6bkdzREhFdWpX?=
 =?utf-8?B?SGZFemwxM1JNRVg2S2F0VUVDMkJmVm5ZbXNuNVIySERxNXpIMTV3VkxzR2Jw?=
 =?utf-8?B?SnpRQXNKamQvQm9yNW9iZGVrMVdFQVhqSWNWamJuMDNTZTB6Ulo3Yi9iMGVP?=
 =?utf-8?B?c0dSY1VPYTB0bkdqeVphOEM2Um0wTjZ1OWZtcUtmQVhza29uVENQaW9lWjV6?=
 =?utf-8?B?WHZjYm5PWkJnYkpvUEtxTXpqVWc3S3pCTWVYZEszVStDTVdVeUdWZlMwRW1I?=
 =?utf-8?B?SjdMVnFzcGlDemZHZHFqLzhZL1loV0hSMFJ3YkNLNWpSWjc3TTBNSUxGVUZB?=
 =?utf-8?B?WUpmNUZHeUM3ZlZ3WFpMR2RWaGQzYlJ2QVJCSDZQUWMycFRieVlUemlGaW5P?=
 =?utf-8?B?Sm5CUjVjVS9oeGNvTFk0ZE1OTTkydjVZUkxwWlZ0SlZLdjN4NURiV1B3dkNV?=
 =?utf-8?B?Rkw0Z0VCNzdIN2FCZEVzUXZiQnNSSEpSNlZNSi9aQ2hmM3dFdW1oT3Fic1hF?=
 =?utf-8?B?TU5sU0wyNjVQcTNxNkFWeXJPRVlmUGVTUnRtMEs3OHlhaTYvT3hUUUoxbXhq?=
 =?utf-8?B?bm00ZkQ5NHE0RXVPOHVGK2ZnSDlaZWZaMVkyLzg2bU5DekJyR01pZXQwM0dV?=
 =?utf-8?B?Z0tlY2NSbk9lNHVvWXMzZ2tZVUI4dzQyUy9TVjcrUURxc1d5aXo4QWllR1Fi?=
 =?utf-8?B?S2xKcUhaL0dBSUZnVXJPc0NEV0hUcTdGNXQ2ZnVzczVRbFRjNERWSWVFRjM2?=
 =?utf-8?Q?3KafPb3VZ1nfxu1P+WUPbbsfuq4WPm1H2cSQ1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d260f411-e524-4de2-ba4f-08df45adc973
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 19:54:42.3424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eo1qxLcsjtioG7Xp80ZcFUeZNbbs6/znEgNXn9K4l05/MzAUJSK0ZddCBxtmhY615gIDI28gSeoe+DmkPvKQN3Yzg9+panZwZIefnOc8ZWYnG1vFuCBSbFaN2D/2pG3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7893

On Sun, Nov 15, 2026 at 07:14:34PM +0300, Nickolay Goppen wrote:
> [Вы нечасто получаете письма от setotau@mainlining.org. Узнайте, почему это важно, по адресу https://aka.ms/LearnAboutSenderIdentification ]
>
> 15.11.2026 19:08, sashiko-bot@kernel.org пишет:
> > Thank you for your contribution! Sashiko AI review found 3 potential
> > issues to consider:
> > - [High] dmaengine: qcom: bam_dma: missing opening brace in
> >    bam_fifo_xfer_len()
> > - [High] dmaengine: qcom: bam_dma: undeclared metadata_ops in
> >    bam_prep_slave_sg()
> > - [Medium] dmaengine: qcom: bam_dma: missing read barrier in
> >    process_channel_irqs()
> > It also noticed 2 related pre-existing issues this patch does not
> > introduce:
> > - [Critical] dmaengine: qcom: bam_dma: ring buffer space miscalculation
> >    in bam_start_dma() [1]
> > - [High] dmaengine: qcom: bam_dma: unclocked register access in
> >    bam_dma_irq() [2]
> > --
> >
> > commit e40d68fe8bef09bdcbef42721a06c3fd7ad7197d
> > Author: Nickolay Goppen <setotau@mainlining.org>
> >
> > dmaengine: qcom: bam_dma: Report the residue of packet
> >
> > This commit calculates the number of bytes transferred from the BAM FIFO
> > descriptors and reports the transfer residue in async_desc->vd.tx_result.residue
> > upon descriptor completion.
> >
> > > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > > index e62e411dc8f8b..b5cfe3ce34060 100644
> > > --- a/drivers/dma/qcom/bam_dma.c
> > > +++ b/drivers/dma/qcom/bam_dma.c
> > [ ... ]
> >
> > > @@ -447,6 +448,30 @@ static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
> > >              r.ee_mult * bdev->ee;
> > >   }
> > >
> > > +/**
> > > + * bam_fifo_xfer_len - bytes transferred for a completed descriptor chunk
> > > + * @bchan: BAM channel the chunk was queued on
> > > + * @async_desc: BAM async descriptor owning the chunk
> > > + *
> > > + * For RX pipes the BAM overwrites the size field of the descriptor that
> > > + * ended the transfer with the number of bytes actually written to memory,
> > > + * which can be less than the buffer size (e.g. an IPA packet).  Those
> > > + * values live in the FIFO copy, not in async_desc->desc[].
> > > + */
> > > +
> > > +static u32 bam_fifo_xfer_len(struct bam_chan *bchan,
> > > +                         const struct bam_async_desc *async_desc)
> > > +    struct bam_desc_hw *fifo = PTR_ALIGN(bchan->fifo_virt,
> > > +                                         sizeof(struct bam_desc_hw));
> > > +    u32 len = 0;
> > > +    unsigned int i;
> > > +
> > > +    for (i = bchan->head; i < bchan->head + async_desc->xfer_len; i++)
> > > +            len += le16_to_cpu(fifo[i % MAX_DESCRIPTORS].size);
> > > +
> > > +    return len;
> > > +}
> > [Severity: High]
> > bam_fifo_xfer_len() is missing its opening '{' after the parameter list,
> > which breaks the build when CONFIG_QCOM_BAM_DMA is enabled.
> >
> > [Severity: Critical]
> > This problem wasn't introduced by this patch, but in bam_start_dma(), the
> > producer side of the same descriptor FIFO ring buffer miscalculates
> > available space [1] and can overwrite in-flight DMA descriptors:
> >
> > drivers/dma/qcom/bam_dma.c:bam_start_dma() {
> >       ...
> >               avail = CIRC_SPACE(bchan->tail, bchan->head,
> >                                  MAX_DESCRIPTORS + 1);
> >       ...
> >               bchan->tail += async_desc->xfer_len;
> >               bchan->tail %= MAX_DESCRIPTORS;
> > }
> >
> > CIRC_SPACE() is called with MAX_DESCRIPTORS + 1 (4096), which returns 4095
> > when the ring is empty (tail == head), while bchan->tail and bchan->head
> > wrap modulo MAX_DESCRIPTORS (4095).  Enqueuing 4095 descriptors wraps
> > bchan->tail back to bchan->head, making a full ring appear empty so
> > subsequent submissions overwrite active descriptors before hardware
> > processes them.
> >
> > > @@ -732,6 +757,8 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
> > >              } while (remainder > 0);
> > >      }
> > >
> > > +    async_desc->vd.tx.metadata_ops = &metadata_ops;
> > > +
> > >      return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
> > >   }
> > >
> > [Severity: High]
> > metadata_ops is not declared anywhere in this file or its included headers,
> > which causes compilation to fail.
> >
> > > @@ -881,6 +908,11 @@ static u32 process_channel_irqs(struct bam_device *bdev)
> > >                      if (avail < async_desc->xfer_len)
> > >                              break;
> > >
> > > +                    async_desc->transferred +=
> > > +                            bam_fifo_xfer_len(bchan, async_desc);
> > > +                    async_desc->vd.tx_result.residue =
> > > +                            async_desc->length - async_desc->transferred;
> > > +
> > >                      /* manage FIFO */
> > >                      bchan->head += async_desc->xfer_len;
> > >                      bchan->head %= MAX_DESCRIPTORS;
> > [Severity: Medium]
> > Can bam_fifo_xfer_len() read stale fifo[].size values before the hardware
> > descriptor writeback is observed?
> >
> > bchan->fifo_virt is allocated with dma_alloc_wc() (Normal Non-Cacheable
> > memory on ARM/ARM64, which allows speculative loads), and earlier in
> > process_channel_irqs() BAM_P_SW_OFSTS is read with readl_relaxed():
> >
> > drivers/dma/qcom/bam_dma.c:process_channel_irqs() {
> >       ...
> >               offset = readl_relaxed(bam_addr(bdev, i, BAM_P_SW_OFSTS)) &
> >                                      P_SW_OFSTS_MASK;
> > }
> >
> > Because readl_relaxed() has no read barrier and the address of
> > fifo[i % MAX_DESCRIPTORS].size does not depend on offset, the CPU can
> > speculatively load the initial buffer size written by bam_start_dma()
> > instead of the byte count written back by the BAM hardware, reporting the
> > wrong residue to clients.  Using readl() for BAM_P_SW_OFSTS or adding a
> > dma_rmb() before reading fifo[].size would order the reads.
> >
> > [Severity: High]
> > This problem wasn't introduced by this patch, but bam_dma_irq() calls
> > process_channel_irqs() before acquiring a runtime PM reference [2]:
> >
> > drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
> >       ...
> >       srcs |= process_channel_irqs(bdev);
> >       ...
> >       ret = pm_runtime_get_sync(bdev->dev);
> > }
> >
> > If a shared or spurious interrupt fires while the BAM controller is
> > runtime-suspended with its clocks disabled, the readl_relaxed() of
> > BAM_IRQ_SRCS_EE at the start of process_channel_irqs() accesses an
> > unclocked register and triggers a synchronous external abort.
> >
> > [1] https://sashiko.dev/#/bug/linux-a877fd6c-244a-404b-88a7-7d77506711a9
> > [2] https://sashiko.dev/#/bug/linux-0ca05019-399c-4f9d-a7e1-d74c7ddced75
>
> I will address the issues of the patch in next respin, but I don't know
> what to do with issues that |
> wasn't introduced by my patch.

You can address existing issue later.

Frank

>
> --
> Best regards,
> Nickolay
