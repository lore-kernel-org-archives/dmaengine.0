Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792752886;
	b=zxeQy88bgkZqoG5S1ueHUSBgc0LMU777LhEjp5uJ9wk14kPMRonPY46RalHzsH74jYjg
	 /ltk/0QpbO5mfJCQRuZDVeTwuLdqm9zTqsb8P/IQYz6ImW0xvCxMnaZlWHNbB9fI9t/aw
	 8pHbHKmkZ40nXSCwS7URtfKpMBdBKjIqcckVxgki4d2Ci/udtkg2jsijmDh4/2SQ5Iykl
	 0yCA3UwFPnOej+tUQyjZ6uI546ELxAink5g7zOfPOBXuaFrEWf0l5LsfWOOaGHYN4amC+
	 TjatbHFnJvJ2bfwjr/MdqOkSFDhG8eFpTnRTwvppm2oZ27Pj9EbRFHLDX65iXXl0NlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752886;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=Ul0u/GQi3VvzX7tQWIu+IItp/g7LoJ/Bx6nWXbSsD7E=;
	b=qCC6xWatd47MHtnu6jsilpPzRImdxc1BlFGSB3VPMeN96WBlTiYoB+x6bK4XURKQWnPT
	 LHbB9VYdw1pKgmDWTnT68yhKsmN2veXMs7kKfxXL9fnFejFk7FAvMFxVKzORL4AF2F4Mx
	 9alX1OOXI0TXL6hi7Zj5WMF9dIfTrPasr6ePcvFPqu5w/qwBg3XJKmqBs0eWLwRm0Ud3u
	 QfO6DBSyXppUMWddJBMEk1KLlAv7y/9TlZpVKSH4H53DSUK00d0m2FOWoW3sL9WsBhzIv
	 Op2Oopy8JyGZ6xQDWPCS1APua1PrPx4S0obDNgA5HUJEGRlioqxss/8+178Qb4HyH3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZPzK4HK4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.35
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B0606A31B;
	Fri, 23 Oct 2026 10:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZPzK4HK4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzpbnFjsGC0k8noq4yT83+VC+gpxaSMuM9amjMMuk/4nxTIhDxyWKy4i6RCkVkz6jcwLANxwpZ6yL0xA/f9Jxkinp05KM4n6p4n+049a1gTV662DknH6pAHEZFL/DT5OcoEEzVN1DQa4EtKji9gMGu3InuTkmfzzmEDQ08RJT3zqTjeC7BTMzk+HdWC1uwB4stWelM/UCS6t2tRiDm7+sEjSl8kpFjIpR7mZqtJw/qK1Vdpy0TGq9GOUyp8hrswbn6M/Gopu3Jc+aNqFpe/89xcsU1VYfD6bI720AckuN4NxFgIBUgKnE3aidYqEKlX/NAtH+4bHWx2few8ksZ7pZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul0u/GQi3VvzX7tQWIu+IItp/g7LoJ/Bx6nWXbSsD7E=;
 b=ZJpnr20eEpQHBPqvIaCRDUKewEt2NJm9E1bLVJqmoAgGvL7WfakrfUpY/oGqMcTYwwqxPx1uNZxCEzsXLgeiJ0YLPF/fGbqZDtOz6HLCly6G3J1epSb7EJbEr9pVkB7ZQIsoVvrDqLc9FvLELpGJ4zkHRbqZws4PeIbY4ug6gXARC55BjzlCsUTVPY3j+irhSbsXPDtQEw9qSu325URUWkiMOZrOuA0JlkCs6kmjrCSnFpYy1LKEossTx/PXnJNvj88N95bGqNgCJl+UFpRq0iNqrhMV81jKbn5BKFYIXaZknfP2M7BeVrfNPUSZW9/mvwcPDT3bFppbh/8msKYs5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul0u/GQi3VvzX7tQWIu+IItp/g7LoJ/Bx6nWXbSsD7E=;
 b=ZPzK4HK4T+76p5SiOeIYt3GN1qS6yJXejoJYchmlIsJTHGMy/u7c31jZJmIlWztPk6Wo06qbPYJh/EXQm0d2wIiKATMBAHdIJAApeGQzPDYaNwuNgwS2pqMIb9rPE8NNEo1PC33nbp/FXWpXisg2YtqNgIupBOVSci17tkAfz2DSvFdpk8303eCg3w/WWJsZxE7/R9xNwRAOdQUvAvoZK0FbvzDTxxA+cbrgwu+AxSUxbIkLlzRoBIogPuSkafjkN9taCL4ivDDciXQAhrn7AiIqnrToiVrbhWcSUjmYQMl5DKW3Qyq0CRtZlFJXJAOQwMmLmnco2BjkTxGHT4CUvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by GV4PR04MB955734.eurprd04.prod.outlook.com (2603:10a6:150:402::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 10:54:42 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 10:54:42 +0000
From: joy.zou@oss.nxp.com
Subject: [PATCH v7 0/4] add runtime suspend/resume support
Date: Fri, 23 Oct 2026 18:59:07 +0800
Message-Id: <20261023-b4-edma-runtime-opt-mo-v7-0-418e53c5f9b7@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPs922oC/yXMQQ6CMBBG4auQWTtJSwTUqxgXLf3BMWlL2mJMC
 Hen6vJbvLdRRhJkujUbJbwlSwwVw6mh8WnCDBZXTa1qe3XRmu2Z4bzhtIYiHhyXwj6ycvpqANs
 5C6rxkjDJ5ze+P/7Oq31hLN8b7fsBpRjFBXoAAAA=
X-Change-ID: 20260811-b4-edma-runtime-opt-mo-0d19aeeb5dbe
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|GV4PR04MB955734:EE_
X-MS-Office365-Filtering-Correlation-Id: 1725284e-a946-4f8e-01f5-08df30f40abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|261021121427099003|6133799003|18002099003|10067099003|261021123027099003|261009221227099003|11063799006|261009223027099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	JtiHiUWOLtNePoUzthp5Flxf7zd6qn5GhK91PMvnotTPzjIBcCes81KfaNBV2pW9PNB77y5Ul2wDaVfEW36842NTn+ifl5eCzCvY2xdih+zxu6BOF9EDQtngyYBOA0Ke9g9n8x6zQJF/lEXfe00TvIGM/iEo+o3e2jiWrEDK27NwaHN4vmXqf36EsJWlRKuiQp+wGf0IXsOlF0K1IL1pn2UaGjQNKzPkvMTa2ONzidGKz5VeT04tpIaSLRI2UB65odCRZ4sPzoIDgD0brxpBiDjHYjjND5qwwfS0rlB9vzeTW59UDry+WWlRTEafD4WJv3q4TSUVO0dx9awVcXdTi1IUmDRvFD2gP1bPmUYoUA/VwhumBiz4bYdn4/1GsEfv5kYfMCfKK6owlYL13+/Sv85uKkjlbOIsxnHsvmbZFFUr1m2wR8oxyilHWmgc75lBmjAcsSo6FG92AES4jIiCJUlINy9gZGDPz1s27XuKW64wSHsHjxcbjT+Isyz516ktVKxQ1t/6EnSVya0eICO68PpM+4K2V77uidML3V+LxiKhE7cTLRX+StWfkXGo0pZdH1TyDlcWtIRCUe9fkzHZxrVMaibabz7tmVXzQNEwwKD1DaMJ2O0vVps9B/5YzILj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(261021121427099003)(6133799003)(18002099003)(10067099003)(261021123027099003)(261009221227099003)(11063799006)(261009223027099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UktRN2tXZE5tNlI0VWNOWU53TW5oMzdYdTJpZVNOU3RmaWxUdHBvanZPK2dq?=
 =?utf-8?B?NmpqdjhzcjRvU1oxVlQ3SG5nbUVibHh1a09wZWdpekRxQzV1VUNjTk1WN2hE?=
 =?utf-8?B?YlQ2RFpGMzVrRUNlNnV4RWlwejBlUUd1OVhXT0dKaXQzeExSSkk2NHEvbEpM?=
 =?utf-8?B?ZTUxQlRQUFlJQ1BUWGdBU2hUWm9UN0JmWjlEVGJnNWo5R2U0TjAxWjVINWhu?=
 =?utf-8?B?bXpHd3VzUjVHeDgrdXpjdEgza3RXRWoza0hCdzF1dFRYOGFEMVQ5am9taEJw?=
 =?utf-8?B?RkJkN2hMWVVuZXZPMlI3QU1lVk4zZmY4Z0w2TVVIRGxudEhaT0xmWEN1Ny9K?=
 =?utf-8?B?c2ZDYzhQUktJQTFDbDZsWTZvMk1lUkJoc2NCOUZlbTh1QVh4VE5HcU5GODhF?=
 =?utf-8?B?Q0lQUk5DZTBpaE1hekh5eVcxRjNtc1RKLzhTeWdKYmNYdXhQOTBNMFBzOG9P?=
 =?utf-8?B?YXhNeU9WK3dQWE41UDluLzFoNnE1UjRTcXNDR2ZsY25Jb0Fhdm1QN1FuTnov?=
 =?utf-8?B?eEtMUEFEbzBiZUxsUURPaVFmWmwzTUs1emdsTmJ6djFCTTdyUmE3SFlHaFk0?=
 =?utf-8?B?dlNDOXhxbFpnUVhUaXZ0cWRmaHVRSGpQYW8valFrUitGbmdueVB0ank3bVcr?=
 =?utf-8?B?RzVoNk9reWxSd2lOeXVybnZDWWFXWjR3UWtpMjRTQzJVa0dOV1JaODIvUlB6?=
 =?utf-8?B?bk8vVzNXbXRqSE5lNnJKSnBUQlhKWVh6ZW4rYThHSGROSldlekpOdzBEVis4?=
 =?utf-8?B?U2puNXZHdFhrV0ozREJHcEF6eUkwamxWNlh1WTNjVVp0azEvdlBPaHNOZlJm?=
 =?utf-8?B?N245MTNGc2I2WDB6KzZHQ0xzVEY0cXFCejBYRm9KZWpMVGo1b1BOaytHSXQw?=
 =?utf-8?B?anI1QUdFVXNpYjhTN1NmazIrRlZyRkYwNkk3UFpQN25EYlAzVkV2SDlESjBj?=
 =?utf-8?B?dExDU1NVbklnZkZQanFTTVkxSE5kRzhJTEpTTnRHN0doYXJyeEIrcDAya0FQ?=
 =?utf-8?B?VzNKdlV2RnQ5UmJKbnptSjFxNGRpOEJDYloyeEE3ZnZ1V1pZSkVMTlFXUzdJ?=
 =?utf-8?B?RmlyQTFyQ0FZekFGSWdIMjNJaWFYTXBOMkYwdnpuMTVuemJIMXhWVTJUVmdE?=
 =?utf-8?B?N3NQY3VRelN6emRqU3ZsMjNqTHlpNUp0b2F2SjhwZmhpWHR2b2VFR1FKTnJp?=
 =?utf-8?B?cVlabkxFRFl0L2RZcm05RFRFVnlEVEluVm1jTWJmcVY1N2tCTmZJU1NTb3RI?=
 =?utf-8?B?a3FwRVJQQW1xMnRldUlYazBXMDJoZmYzNGJEdnJhcXlWZjdYK1ZKYVQzajAr?=
 =?utf-8?B?b2FZTUNIMy9DcXQ0a3M4YU5xL1V4MS95aVR3QzV4NTVLL09kN2swTTU4TWNp?=
 =?utf-8?B?WGVHVFdQNVlONjhWTUNxNXFkcjZiR2VieDJLVWVoZDNhMEFxVXUxNmVwRm15?=
 =?utf-8?B?WFRtT0gvNzZiTWozc3RKcFhFbGl5SDVFaHMrcWxpSVc5WUgvTlBnUmhBcGUv?=
 =?utf-8?B?dTZHeENWSkoyV2V0UTFUZVZlQ2p3dWJhMWRQYXJOdDkyb2xuNnNPWG8xRWdj?=
 =?utf-8?B?YWJZU3ZWWkhvTzMvMmU5bmVkUFpaQVhtdExNMjJPM0psSFZyUG8xd3BZa0Np?=
 =?utf-8?B?MEoyWjFUNlRqNmJXcHh6QVA4ZEFBK0orbURqS3J1b3UvUGJqN1AvVjhrY251?=
 =?utf-8?B?aEdnWmMxU1VmSm9pUHY0MHhmRTFuOU5aZTQ5VXVGODVCV1dSSXNDcC9kY0ty?=
 =?utf-8?B?YlNHZStLZ3FPbzIyb0ZWcmpLU0FqQSs0dmlIRXRUajl6Ym1ud0xaS21LZ3BN?=
 =?utf-8?B?YmQwaFk3T3U3a3BmQUM0MGsxTlk2UTJDQkd0OTJ3Q1RoN1phU0NaNHVSREFu?=
 =?utf-8?B?b3NjMzlpZXRsdXVFZFNvc2FBWXJXcXFuaWVsVTh5VTdtU09TUE9aVmpuS0tD?=
 =?utf-8?B?MWZ6dkdFRkp3ZE5XbkEyZDdxaHFrSmJIVXdKTG1MZXdtUm45eDVxN2pUQjQw?=
 =?utf-8?B?alFaN0F0bFA1dENvdjBsQk9tSitMUTRXd09ncDBGbnJId09QQXdBalY3NzVm?=
 =?utf-8?B?MlpaNis4WFpFSjRTeitrTGZJaXdob3hiOXNoSXhEaHRHQ1ZTWFkwREt4RFc5?=
 =?utf-8?B?QVpGSGxvcGdjMDVreUNmS0NGNGREK0k2TW8zZ3R2NG52akMzWmlaenBEYnFV?=
 =?utf-8?B?c1pja1ZoWjQzSmc5cHVXOWNXMDk5YjE2RVJSK1g1d0gxaHhJcHVieEFHc3BG?=
 =?utf-8?B?Z2FiQ3FsMXU1Wlp5cStXMnBkbDFzZ0hwOWpSWnlGS2xBOVJvc21qeVI5OE9H?=
 =?utf-8?B?UDVnbzZ0bWNObnB3d0VpUC9lODBmcCs1VFNZYjhLNDRxallHQ0E1a1ZVVW1u?=
 =?utf-8?Q?9hPWNdhFEtXAmbSQKQ2ZE1RO6RI25AlQU5gn4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1725284e-a946-4f8e-01f5-08df30f40abe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:54:42.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hc+INDupBoe+48rpYkoWSuzziZ8fnumXKSV5ZaXlyijCcUWCjRgR0bISmTA9PrOiFkLreKQiLLW030MNuNHxe8XsOB7AgNwG+PB6el4BJDTOLaX/hz8mGCXQ2UAgDPUy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB955734

Clean up driver FLAGs and introduce runtime suspend and resume support for
FSL eDMA.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in V7:
- replace devm_clk_get_optional() with devm_clk_get_optional_enable() for
  patch #1 and #2.
- replace devm_clk_get_optional() with devm_clk_bulk_get_optional_enable()
  for patch #3.
- replace devm_clk_get_optional_enable() with devm_clk_get_optional() for patch #4.
- replace devm_clk_bulk_get_optional_enable() with devm_clk_bulk_get_optional()
  for patch #4.
- use PM_RUNTIME_ACQUIRE_IF_ENABLED()/PM_RUNTIME_ACQUIRE_ERR() guards to
  replace pm_runtime_resume_and_get() and the manual error handling for both
  the eDMA engine and per-channel devices.
- move dmaenginem_async_device_register() after runtime PM is enabled.
- move fsl_edma->drvdata->setup_irq() to the end of probe() and use
  dev_err_probe() on failure.
- check "irq > 0" instead of "irq" before synchronize_irq() in
  fsl_edma_chan_runtime_suspend().
- add fsl_chan txirq and errirq synchronize_irq() check in fsl_edma_chan_runtime_suspend().
- add comments explaining the pm_runtime_get_if_active() checks in the interrupt handlers.
- dropped patch #5 since this is a pre-existing issue that will be fixed in a separate patch.
- Link to v6: https://lore.kernel.org/r/20260701-b4-edma-runtime-opt-v6-0-354ff4229c00@oss.nxp.com

Changes in V6:
- add synchronize_irq() before disabling the channel clock in fsl_edma_chan_runtime_suspend()
  per AI review comments.
- add pm_runtime_get_if_active() in interrupt handlers to ensure registers can be accessed
  correctly per AI review comments.
- remove manual fsl_edma3_detach_pd() call when device_link_add() fails. The devres
  framework will handle cleanup automatically on probe failure per AI review comments.
- clear fsl_chan->pd_dev_link after freeing the device link to prevent potential
  use-after-free issues per AI review comments..
- move fsl_edma->drvdata->setup_irq() atfer edma engine pm_runtime_resume_and_get().
- replace devm_clk_bulk_get_optional_enable() with devm_clk_get_optional()
  and clk_bulk_prepare_enable() in order to use runtime PM for power
  management later.
- replace devm_clk_get_optional_enable() with devm_clk_get_optional()
  and devm_clk_prepare_enable() in order to use runtime PM for power
  management later for patch #1 and #2.
- add new patch #5 fix use-after-free issue per AI review comments.
- modify the commit message for patch #1,#2 and #3.
- add Reviewed-by tag for patch #1,#2 and #3.
- Link to v5: https://lore.kernel.org/r/20260513-b4-b4-edma-runtime-opt-v5-0-1e595bfb8423@nxp.com

Changes in V5:
- add three new patches, two of which replace devm_clk_get_enabled() with devm_clk_get_optional_enabled(),
  and the other convert to clk bulk API.
- remove unnecessary flags FSL_EDMA_DRV_HAS_CHCLK and FSL_EDMA_DRV_HAS_DMACLK.
- remove redundant clk_disable_unprepare() due to the pm_runtime_put_sync_suspend() added.
- use devm_pm_runtime_enable() to replace pm_runtime_enable() and add return value check.
- add return value check for pm_runtime_get_sync().
- replace pm_runtime_get_sync() with pm_runtime_resume_and_get().
- replace DMAMUX clock handling with bulk clock API for edma engine runtime suspend/resume.
- remove dev_pm_domain_detach() when device_link_add() fail because the fsl_edma3_detach_pd()
  also call dev_pm_domain_detach().
- remove device_link_add() DL_FLAG_RPM_ACTIVE flag and pm_runtime_put_sync_suspend().
- add clk_bulk_disable_unprepare() for clk_prepare_enable() fail in fsl_edma_runtime_resume().
- remove the extra space before RUNTIME_PM_OPS.
- add skip channel comments for system suspend.
- add clk_disable_unprepare() for dmaclk at the end of probe function.
- add clk_bulk_disable_unprepare() for muxclk at the end of probe function.
- Link to v4: https://lore.kernel.org/imx/20251017-b4-edma-runtime-v4-1-87c64dd30229@nxp.com/

Changes for V4:
- fix a typo dmaegnine/dmaengine in the subject.
- Link to v3: https://lore.kernel.org/imx/20250912-b4-edma-runtime-v3-1-be22f7161745@nxp.com/

Changes for V3:
- rebased onto commit 8f21d9da4670 ("Add linux-next specific files for 20250911")
  to align with latest changes.
- Remove pm_runtime_dont_use_autosuspend() from fsl_edma3_detach_pd().
  because the autosuspend is not used.
- Move some edma channel registers initialization after the chan_dev
  pm_runtime_enable().
- Add clk_prepare_enable() return check in fsl_edma_runtime_resume.
- Add flag FSL_EDMA_DRV_HAS_DMACLK check in fsl_edma_runtime_resume/suspend().
- Link to v2: https://lore.kernel.org/imx/20241226052643.1951886-1-joy.zou@nxp.com/

Changes for V2:
- drop ret from fsl_edma_chan_runtime_suspend().
- drop ret from fsl_edma_chan_runtime_resume() and return clk_prepare_enable().
- add review tag
- Link to v1: https://lore.kernel.org/imx/20241220021109.2102294-1-joy.zou@nxp.com/

To: Frank Li <Frank.Li@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Frank Li <Frank.Li@kernel.org>
Cc: imx@lists.linux.dev
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Joy Zou (4):
      dmaengine: fsl-edma: use devm_clk_get_optional_enabled() for channel clock
      dmaengine: fsl-edma: use devm_clk_get_optional() for DMA engine clock
      dmaengine: fsl-edma: convert DMAMUX clock handling to bulk clock API
      dmaengine: fsl-edma: add runtime suspend/resume support

 drivers/dma/fsl-edma-common.c |  14 +-
 drivers/dma/fsl-edma-common.h |   4 +-
 drivers/dma/fsl-edma-main.c   | 330 ++++++++++++++++++++++++++++++++----------
 3 files changed, 261 insertions(+), 87 deletions(-)
---
base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
change-id: 20260811-b4-edma-runtime-opt-mo-0d19aeeb5dbe

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

