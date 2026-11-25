Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604099;
	b=vh6ANUM3DvpDK4sTR0mgdWofdeKiqnd/F2g6+MN+cfU9gwV/JFDUGD03fQd8TbvCqYOB
	 IF5sG0ITt2LAePx6VNF4ABcNp9EN0WuV9yGCUFPn04q7q0cZx8/p63sVreqlzlTe2k4GN
	 aJcoUJou8XJT5GiFTjBgYzZFVRGyH8okcmYT1VVusSGXpp3c5YRhAEPEa2k8CPXXfko5H
	 2tieZv52LsL8rRvswKE5vtqulvDNKCn3cxYUtbb0m+7itak4ueAD7rnrFRzLKJWVyUuty
	 qpnGFkM9Z9L8OIV0IZJGC9i59+6gXH7GIvRTgybW1WW/A8PBPJ2luh8iqm4WhpHgiyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604099;
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
	bh=qOUxT+CpOWygdht6I7cDd06uWonSHTPR2F5d5695OVo=;
	b=N2nYinu1gE3+hvysihwbE1X/vnyiA9qRjXTp3FWvgSnfAQ3mSL98u0kWAFVeHcuw5kYM
	 tXqJ8dGkU8G/0W1+xlqwMcvjyRbdmgUSk+6QR7CO3wOmRgrDYz1Q6IKCJlUqzXlnTnpxk
	 8RcbiLUVwUajJ1Pa5dJFGkzW6/RtvVkyRQhgclN4L59+pDGSsPbAM/RRrApF5WEnATncQ
	 tUol8XkiQQeqEHoD8aif+Cgn3+dL8aCPKxlFqVwrh+Lf2hA/JhkscKy4J1Gtq/jtZ+8rP
	 s8Ty4m0M1vIGPWVvC+79UFA+oQvWBolCAzyMNqXmICVn531hAGJSvhctpmo5dhFgWnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=a6F7A16H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.2
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957AA606A331;
	Wed, 25 Nov 2026 10:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 957AA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=a6F7A16H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrYEc6X6L2wEOeN+WMFRY/iqSB1qvV1AbzDPtJlgtuX/QxaPp0stvOCrSL7dllDUaoyvJD16mFr6SRhbuQVrfRc5LIe+ygTmqkgBKeni74DQyRYp/VVv/DV27Xgl3OuaQru1wg0KX+fBLc0KaiauRgdoTMLsmF3eZfZdRzQeL0iUX3U5aEYa+IIz8PHmAWVMTjJ2ACpbZ+y/jHJ1lyf8dE3IER5QjWDwCNNn7x7inZpWrIO8qleDLm9ZHvAcz+A9VbrvA7AWCedB1be4tfQsnXhaMTQd46DKjXoHFTYESHUZmt6RrPayo2TJwOASd+uRoBdoLxaMONNqTxDzZjo79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOUxT+CpOWygdht6I7cDd06uWonSHTPR2F5d5695OVo=;
 b=k61Qrrn2MDNYieuM+0+jShjKf71j2UVgyEtfM0+FRc6erisC8IvC5ApPFXyx1rJB3BN4v272X9+AG3gKthquxvlICAAbQqDn3/ao35ErEHM/OaninGuRwN04z+kh6BzC/MxdDho1lR11NjP97BEl1tRR7+y/PwReXXIwyT0YV0sP7Qo06fA845fs+pEcoNr/+We8d7g4/ohSPhYrscmtiYpa62UVpymjHJV6EJPF5oMHkYjceVgJtRTojTWoTIg6qEV+fr9fED7qKgAnFtMC9A/GbIj1Zho9M94/SUhMz1uWEOdFSoUx7XlScgMzxFR9YUdoFRKgs2F9nHjA9br5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOUxT+CpOWygdht6I7cDd06uWonSHTPR2F5d5695OVo=;
 b=a6F7A16H2BsMsqvzGdvLRcXbTwifDo52n6BJn72thhc7A2q+92jf0lnYDJEfG/UEZZN5W1LmjYKx00cOHJZmXpNXWZME4QmZGi4cxUQEroeNkZhevKVFL3Jf4cqEtXHdEEvRgdP1ta5gTvfW8JSAGFVaBqRZcP29uIF/KsjdeCSxHlTmLh3nLvgFsyS1rqQeNfZhANHNQGwozwVrkFbid59KrBepJIREEhuABHtfqUJDpYorVc/0mmmmqvX0TlpZL+u+4snYbajENh13sGgFaFLR2Y5SZ8ghrKvwKjuAwDVycjT5Y+NLuSqoecFaTg18Hb+TmmCIQOvy+gqbdartmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by BR2PR04MB007356.eurprd04.prod.outlook.com (2603:10a6:2c8:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 10:54:56 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 10:54:56 +0000
From: joy.zou@oss.nxp.com
Date: Wed, 25 Nov 2026 18:58:57 +0800
Subject: [PATCH v8 3/5] dmaengine: fsl-edma: convert DMAMUX clock handling
 to bulk clock API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-edma-runtime-opt-mo-v8-3-81345a3bfb52@oss.nxp.com>
References: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
In-Reply-To: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|BR2PR04MB007356:EE_
X-MS-Office365-Filtering-Correlation-Id: 3053d54b-bef5-468f-50fe-08df4ae28a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|18002099003|22082099003|56012099006|11063799006|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|10067099003|261026140227099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	kwGEX0iBq6zyxAxwI2AttMQiEuEphZLkJpSOg/Vc2ymPyrZcFIG8/EM61Sl1l/1mwh3AIiopA4VjbMdT2YhjKG7CFGYn7WQ0jiUKCehDcbQvCj42c2LKBSWz/QdEO4hercDm4P5vcDKSw5+xwCgrC2tv2fti8ORpdPseMAIizpRXof2V5kNxX/zQoxsQYn/YfTyVs5Um8x4t4Djw6EsbH0JycPTl+CL07osfKnOVe9fF0idHcY5x9MSvyvL1bRdqIFBvB7wU9m9qrZNnglKzkrUEJcm04hvOQYMN3Ef203n5vYnMNjWHP9MHVMzOPQYbV8RX037d6p3P3VP2SDvyFUm/uIH20+pUUxbsGggXyEiUAhdZRUr6PlxQvdoi3Y4hOK/kPkA5ivB7L5HzXicbOR563VUjY1aAEJxtvtoPe5E1WH4z0pNw45o0zXMKEWHZCVrXrmb8AWwe/jwLmbqOwO5BtSgI10CpFzQL2OdfUs2gf0CCCe2l9Zkf6XmAHDz88cenynU6N3+rVjVxeswabi4Hel3w1j0gun0Ssy9WrLOCR8xh9FA9qL85HfSYZ2TJVWNv8tIqrGsH0lrkYjYPl+FtlyvBf2J0MR1CormpA8AO2LJ+OlAaYxCXvswZlTci
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(10067099003)(261026140227099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0cra0pMZTRDQnJGNjNwcEpLYUd2UG1WOTFYMTlRaFlEekNqUUdXRXVBc3cv?=
 =?utf-8?B?ejZYTDUzSnhLeHdKTzB2TFNKUGpVOEprZHFlV0FSZmVzSjJianBxTk8wRkxR?=
 =?utf-8?B?QURLOEg1d2M3dS80dHlUc3Rxd3lYZ2ZXNWFxaTJiMUluYjNhVHFDZjFXSkdw?=
 =?utf-8?B?anJhejJmc2c0bXlCejFxV3hKK2M3c3pxS3BkT3ZjY2xvcFRPbWRrMFErTWNN?=
 =?utf-8?B?aytsbjFnLzA0WWhQSjFJd0FKOHBnTVRtNC9QcDIrOGFaTmNGZENLRzBwRUwz?=
 =?utf-8?B?WklYOENLMWp4TEZjZDFsU1ZwbTZNUTkxQjBxUDh0YlkrNEZDb01KZFo4Ukt1?=
 =?utf-8?B?R2VsUUczS2hHVnBqZ3ZadHRTRU9IYUJpWXJVdWpXdHJhS0htQW1qTlB1aVpS?=
 =?utf-8?B?Y2tEcjNBNzBzRUhla2hUNll1VUpoc3FxOU5pN2NnZnhDTG1KWHBzTHVFZDB1?=
 =?utf-8?B?OCs3b1Fyb0cyLzlFanhGM2NYZHU3UlovWGtnSEhyMlBXWW44Z082SHMvYkwr?=
 =?utf-8?B?VVIxTDB5MVMzNjkrSXpTc2R6cW9TZWs5VThSUStuU252eTRFZWhKdi9nVEh5?=
 =?utf-8?B?QnJHZENFZzk4RFhDMG5JYmw3UVpuU2RzeThUL1R0c09xQzNRSGFCVTFkcFNv?=
 =?utf-8?B?aWhKZDRvTEwvUEdBYnIwRU56NVZlY0haSGs3Y1RROWgwSjl5T2s1djRRcFdP?=
 =?utf-8?B?WnBicVBaTVgrakc3UmsvOE5rZ1htYzlXdnBjSFVzL1NMa3loREZrMG1LeVZS?=
 =?utf-8?B?TU9xeWtxSkxPdzhyWnpiUWNDQjQvUVhYTlE2WnZVa3dBZ0xDQzE0Z3lERHdt?=
 =?utf-8?B?eVEyVFdqWkphLzdkRUxMN2M1ckVkZ2ZyN2E0VjNUV3NtcEQ2QmVSalAzZ1Zv?=
 =?utf-8?B?RlRXOE13VHpmRGF2VmwyZHJiQUdaalFqK21va1V4L0JXd0lpajhPVThHK1hX?=
 =?utf-8?B?Skd5Wm1mK0FwbVR4QU13THVTdHNFK2FoblYyOGd2UG5vNFdtazArem9LSERG?=
 =?utf-8?B?K3BHVm5vWElUT1FGTzlVSTZnK05DOHVQcURMTStBSk5Iak9KYVRlakV0ZllX?=
 =?utf-8?B?V3l5cXhvV1Z4YWlXRERDTm5CNHEyOG5hN3pyOU9uMzd3d2t1clZDOEhJOEJE?=
 =?utf-8?B?MDVSTnZZZnoyZUgxUnBhVnppQWNmSWtNUEVsRDM3ZnRRUTBrUThyQ09NcXNB?=
 =?utf-8?B?N01RbUFlUmU3S2g1TnRhTHcrSmRGdkRENEw5QitWcS90anJIRk1za3VuS0gy?=
 =?utf-8?B?cm16QnFKMVZqU2sxV0MrczBlSEx6KzBGWUJjck05QWF2ZWdjaDVJeTJOQjBK?=
 =?utf-8?B?RzYxVzJYcndLdm83UTlIS1ZQbGx2MlJnKzJHRDNTWTBURXo4RjlDSU9yd0h4?=
 =?utf-8?B?YlFicWUyZ3AyY0NkSDQzc2VGc2VsQzd0akMzUExKWC9MWEJLblIwZis3dWdh?=
 =?utf-8?B?dGNER3d6VDR4M3p5Z3lPTnQyOCtVQzVqYVY1Q1drRkhDT2IxZ09qT0h0dGJI?=
 =?utf-8?B?MkFSTGorWjBSY01pKzZpTVZzQzhwNlZwcVhUTDBzangwUmJFbHNUa2p4cFJr?=
 =?utf-8?B?dEdMRUw5ejNLSS9OUm50UDFnazExZVFRaTQwOU9tRUpUdHpyczVtaFZKKzVX?=
 =?utf-8?B?cHVaR25pRmRNd3crbjZycEwwa1lvZ3p2SmtmN3NvUkI4RG5rUDk1YTExSFpU?=
 =?utf-8?B?cUNyL0xHTUhLb2VEV290SHZDcVZHdHlQTC9rYjdjcUNGVGdJVnVXQnoydGxV?=
 =?utf-8?B?K001czlEanJSUkZvMXRhZTExeGIrekwrMTI3K0c1aElUUVczRVIzSWh2djA4?=
 =?utf-8?B?OTlBdll0aldTZjY0Nmp5SG1HZTZTWHVlclBVR21KYXY5S1Zjc3hGd1Z6d21M?=
 =?utf-8?B?dFBZMlFvRkVxWThYTmhsSm9WMVFxT21Zd3B0V3pBVEJZS0lCMSsydE4zNEtC?=
 =?utf-8?B?YmV1K2FTWTNsOXh0S3RQVWlISFV4aXRsL0FGcVc1Z0pYQ25LMlIwMmNMenNS?=
 =?utf-8?B?VUY3VjFnOFJPcmJoN1BtbmgwSC9nNDJNcStHdkhYZWtkbklXbC91ZC94M2Z5?=
 =?utf-8?B?TERwck9sK2o4Z0hjZ205dXQ2MXJ1eW5HRDV0UmRWcHh6SFkyZkkyd1gwY0NM?=
 =?utf-8?B?b2EvRTljNmZMREJsdzFsS09aSDh2Q2k3SkExWlNHSUtmaGl6K0tIak1ZZVk1?=
 =?utf-8?B?SU95WGIvT0lsQ1VCTW8rWWJ5ZndsQjlrVHg2WnN1dk1LdXoxS0ZzcGd1NGh3?=
 =?utf-8?B?MExDMHdzYmN3aW84cE92UTNnMllBL2FSQ0tIY2hhMDRpR2ExODQ1NEo1NlJo?=
 =?utf-8?B?SnZOSXRkNVZiRmRFTmZDcGdRN2NsaGZHVDJPRFVwc2VscmZHakxjY0t2VmFI?=
 =?utf-8?Q?wqHBp0Pw3Nhw4yR/lu2w7Na1oqy4uKiJQSyNx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3053d54b-bef5-468f-50fe-08df4ae28a92
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:54:56.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62CSTITKncOzR8gEqzWr+zB/xQ8jr+vIc7rchhETFRH4CUd2nSrxvZMSgfr0CtbCdEA89DWY+PBojyZLJYQqHnULIloemF2+MaD+RkBsp3H0iSFkQuf7Cu4mYwKDeLDf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB007356

From: Joy Zou <joy.zou@nxp.com>

Convert the DMAMUX clock management from individual clock operations
to the bulk clock API to simplify the code.

Prepare to add edma engine runtime pm support.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes for v7:
- Replace devm_clk_bulk_get_optional() with devm_clk_bulk_get_optional_enable().

Changes for v6:
- Replace devm_clk_bulk_get_optional_enable() with devm_clk_bulk_get_optional()
   and clk_bulk_prepare_enable() in order to use runtime PM for power
   management later.
- add Reviewed-by tag.
- Link to v5: https://lore.kernel.org/imx/20260513-b4-b4-edma-runtime-opt-v5-0-1e595bfb8423@nxp.com/
---
 drivers/dma/fsl-edma-common.h |  2 +-
 drivers/dma/fsl-edma-main.c   | 41 +++++++++++++++++++----------------------
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 97b3a9872e90..12db403204c5 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -260,7 +260,7 @@ struct fsl_edma_engine {
 	struct dma_device	dma_dev;
 	void __iomem		*membase;
 	void __iomem		*muxbase[DMAMUX_NR];
-	struct clk		*muxclk[DMAMUX_NR];
+	struct clk_bulk_data    *muxclk;
 	struct clk		*dmaclk;
 	struct mutex		fsl_edma_mutex;
 	const struct fsl_edma_drvdata *drvdata;
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 6a296fffb837..fdb2577d1ccb 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -531,14 +531,6 @@ static void fsl_edma_irq_exit(
 	}
 }
 
-static void fsl_disable_clocks(struct fsl_edma_engine *fsl_edma, int nr_clocks)
-{
-	int i;
-
-	for (i = 0; i < nr_clocks; i++)
-		clk_disable_unprepare(fsl_edma->muxclk[i]);
-}
-
 static struct fsl_edma_drvdata vf610_data = {
 	.dmamuxs = DMAMUX_NR,
 	.flags = FSL_EDMA_DRV_WRAP_IO,
@@ -752,23 +744,28 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		fsl_edma->chan_masked |= chan_mask[0];
 	}
 
-	for (i = 0; i < fsl_edma->drvdata->dmamuxs; i++) {
-		char clkname[32];
+	if (fsl_edma->drvdata->dmamuxs) {
+		fsl_edma->muxclk = devm_kcalloc(&pdev->dev, fsl_edma->drvdata->dmamuxs,
+						sizeof(*fsl_edma->muxclk), GFP_KERNEL);
+		if (!fsl_edma->muxclk)
+			return -ENOMEM;
+
+		for (i = 0; i < fsl_edma->drvdata->dmamuxs; i++) {
+			fsl_edma->muxbase[i] = devm_platform_ioremap_resource(pdev, 1 + i);
+			if (IS_ERR(fsl_edma->muxbase[i]))
+				return PTR_ERR(fsl_edma->muxbase[i]);
 
-		fsl_edma->muxbase[i] = devm_platform_ioremap_resource(pdev,
-								      1 + i);
-		if (IS_ERR(fsl_edma->muxbase[i])) {
-			/* on error: disable all previously enabled clks */
-			fsl_disable_clocks(fsl_edma, i);
-			return PTR_ERR(fsl_edma->muxbase[i]);
+			fsl_edma->muxclk[i].id = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+								"dmamux%d", i);
+			if (!fsl_edma->muxclk[i].id)
+				return -ENOMEM;
 		}
 
-		sprintf(clkname, "dmamux%d", i);
-		fsl_edma->muxclk[i] = devm_clk_get_enabled(&pdev->dev, clkname);
-		if (IS_ERR(fsl_edma->muxclk[i]))
-			return dev_err_probe(&pdev->dev,
-					     PTR_ERR(fsl_edma->muxclk[i]),
-					     "Missing DMAMUX block clock.\n");
+		ret = devm_clk_bulk_get_optional_enable(&pdev->dev, fsl_edma->drvdata->dmamuxs,
+							fsl_edma->muxclk);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to get/enable DMAMUX block clock.\n");
 	}
 
 	fsl_edma->big_endian = of_property_read_bool(np, "big-endian");

-- 
2.34.1

