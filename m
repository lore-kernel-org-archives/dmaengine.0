Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792483645;
	b=e5Clg0FvWmwllGzphe0BeH9yxMyky05DKBVk+LTX4kfVU3UZIHj2dO2cYCjGbZpQZ4Jz
	 nZemzZUYIaQUOn70M8H/TxeDORyr7DFnB6o+N2imGP4LDmgexJkRmUP630KdX+7A4dWQU
	 vgpeKFuU/eIqhvVXEy69aQlf9wz5E+9TA6PQiIXiS/2JnPWgRDF+XMQJ2Gl8OgGhYjfVe
	 cMzluX5gZoaR00kAcXxZzrVfaTmQcDu6cYp31nWyZv0frP3klYaLKY5Fg/BDFpR/EQp1T
	 0kZCPFPqTVF1oTzmLyGriRBZTCZef5LlMqLNIQSMKKETx8Y10cvC6d2xEoiX/mBwCLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483645;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=a9KjyHGU2c+mP3rCY5sUNX6/j9pP1H4+xAC8y40CZG8=;
	b=VRxb/pd6dO/NOfjaUD3LBaGwm2NMzQYnPsdAG6oxYfQh+nM1sHDoI7yNdrwKZANDH5S2
	 GOTHOJE5+d6V131VvZFgBK3WrTy8GM9leDepPfxryrdRmhvUN6pKUeTz7W+y897OQqVM+
	 Fm1pd/Q9cAxifZoB7nZgr/Qxf/ASDea7hyvP9HYukoY9rrJNH53g/jxHfK+OnIMXLWd3l
	 HRi01POF6JxuvgfsjumCED2lfFI4aoK8EzPY0RWvg19NceaMXaMQqgAKZIVkObLHUPJeW
	 vxJns5BSpx5K/bQMBM7CIUVGzgaUsq/4m3k5EiUptODcX7DxwrQE8g4S/7xBEmNnGhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WjHB+Dvs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.28
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1CB606A323;
	Tue, 20 Oct 2026 08:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D1CB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WjHB+Dvs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8h2azjDFdBiPfKf0PVzfi5GqdNRVAiUJPeAzjMayjfhovxf/7wne+d0hOAJluHcFBlJKRrg29uEYLFWjHdzqfVj73dXq88/N/qvtUgilGpDLfzqEDeDMq36iwfphaPd4sfdvfWFeLrQh2uuiVLbRm/8ndbka0drFOBVTAjssZ3p6/l7g8d2J96Nb9vKy3VgNqjhNB+NpzE2sjyAp8tP7H378MdRp2B1LunSqnzOYuN7FOVp1mdx3b5vviuKZzcuTS5dKpVfgGNviSovbM8W0FbFfBvseEKkhcf0LpAmAnFedUOOIN8w/nKAYyBM7w06EB6qNzlToWPlt6h487kWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9KjyHGU2c+mP3rCY5sUNX6/j9pP1H4+xAC8y40CZG8=;
 b=bqZWqTWiILVvliKpHyRqnlZ3lZ3NMFa36mwaUS22aRlSrklMcXyuefIPkznWAlVJwMWyolNXq8/kf8kbWumbljFUWa6iVo0poYWN5Q75cblqBDaQ4qLNE5XgHHCVIQkxmwPGKskC6W/++HFcqzo4Go9a72rTk2dVnBNd+rHuviPbC5PqGBntYy3+mwe9O9M8ruCew1vTjUThFp0GacWbnjRVoLwTrDsGIFtEN87yNx18GbXofbqykW8QSXlPDR3HYLHgFKxpYrPad50z5wczi7suQ7xTp59GoM87zBiQ8t5igK28ymbuA3bGdFFntPdVmip2Jlj7zkZv4jouE6z5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9KjyHGU2c+mP3rCY5sUNX6/j9pP1H4+xAC8y40CZG8=;
 b=WjHB+DvsU3kCA8pI4opCD9t5vp/nDOF1eIP4zbByKIHKn4x3M9UcmFzVx1a8k+oRggO+BVlF9CQbvkgK/lWhtYLlSm7ZuY6GcmYAE2PXdTevSVAsDldlDVsNp9KoUsL7IUQvQKMMMw0TcSablQHWGaFnV8Ml6qE2Ab6LRZEH9QdWlhJ6IjODCq7PlAtWpHxso0Hd9jOPYtOhVpRx04EqvJlvkp7+ddhikFl95KlWcS9ABiL0hv3dSXuCl7fLomRVdqbs/baVcGuIibX6qZSt+tY9EGDMifFP/MzbmBEEpwNUEWDL7FwsW2694LAbM0DaE1yBF/33wS2ugb6LWBNeNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA4PR04MB7534.eurprd04.prod.outlook.com (2603:10a6:102:ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:07:22 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:07:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	sashiko-reviews@lists.linux.dev,
	imx@lists.linux.dev,
	vkoul@kernel.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 2/3] dmaengine: fsl-edma: support per-channel DT child nodes
Date: Tue, 20 Oct 2026 16:04:34 +0800
Message-ID: <20261020080435.228140-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <atI9MsuyHFqi1i_4@lizhi-Precision-Tower-5810>
References:
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA4PR04MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 3180411f-12ad-4034-57d7-08df2e812a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|261009223027099003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	D7JzdxjLtwqATs29AGlQlRSafWmH8LMPOpWp/SL6RMsjS9S9+c6ruDBb064cxf+DL3aD9LwK6GWd+TYDB5CIyV3ubMymFXi+TJHA++w0TElzzh+WW2daHJBrGWPx9tdd5AaT7Ryjrr1ALe0N0BfpkN5nM4OLSVvj2kpafezAoBpTIPs3nL/D57K/25JalYkVO0YkL5iNLukTQsK5f62RmlQvTv7TrxonD1/msbeLMjvRoFxdtmFDtffWxMtDa4klUslRkWNda+tcSBoIc7ksFqonqUhbFFhmuW6SQ9lIt/6imcPO229utSDd869S8QA2LNoZTo11rdBA/pZUer6phsmqURgJxMP+2ub7qwdtA2/bJ+67scAAtWSONtJDsR/066OY8KKksEU4AhW6ZLIm2dm9KwVrEdvQvjgjN3cjH36pcy/xZQsndTnSLJqenB9AVEfvNRdziaD/TRFZzkXwOqaDEkep6tCLtKxWeazyqskA6hZvUWiAX9nEOAIOSjH6cmEmP7YnIOmnMF4HlnhGt54YWXZll5NVK+bL7WZCNpMugapItT576spkN7nbw93xZtmmZ9UQe54TQckQYQSMB/fv5XqgB1yo2nMWSPgnWOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2xQMGVSeDNOaWtPR1cxdWxzZWF1bGg5eVVlZnh6aHJnNTNHQzVTYVRKdXpu?=
 =?utf-8?B?eS83ZzFaN0ZMaWdsVldlRk13UkgzTnpjZFR5MFFWTTRZaitvNDZEWkR6ZWhi?=
 =?utf-8?B?UzF5MEppNFBLZzdsN1hGdG9mTGxBYmFwd0hSbkhYQThMN2FSRkJMWVNPMUFD?=
 =?utf-8?B?cVloa0pRdURFN0lzMWlTd0taN1o5UmhBVmhCd0d5WjBsemg1ejV5VFY0bE9x?=
 =?utf-8?B?Qjd6TFYwdHZ2bWVramttWElBVjJkazk5WkdPSFJMS1kwb2EwOGY0a3dlMDlV?=
 =?utf-8?B?K0hrRm5QRHlVVFZsZ3gxWHJXQ0pyT2xaM2tsalU0aCtvYVZySGVEd0Q5eFkv?=
 =?utf-8?B?RG1JQWY0WHBpenRrNXkzRFF2S0ljTUx1b0ZNT2tFemc5Zmg2Y3hzMnVibUpj?=
 =?utf-8?B?c1FZTVlJM1JPQ1A0YnhrVC9ETWhGRHFaQTF1QW1FS201MC91VGRvRFdwa05m?=
 =?utf-8?B?bmc2eFFVNmhvVGxYdVVQejB4OFh2eEgxbnNOMlJUOU5QUW1LUFZoeVJFc3NT?=
 =?utf-8?B?cUFHdThkc3BlMmRsS095M0RsVW9GN0JMcFY5YmMvUnhSeTNycjBWLzNsLzBQ?=
 =?utf-8?B?d3F4c1Qrb3ArZUxWd2EvcjQ5V2RxTVh0Yk9xTS9BTytpSlR1UldhZFRDNVJr?=
 =?utf-8?B?Z1M0SFl3Mk15UHgxZHMremMvemkxLzZzTWg0SkxiQmR1RHRhSlpBbk0vZUFE?=
 =?utf-8?B?MUphMjF4YUkwbEppRE5zR3FFbUkvdFREbFlET0RzU0lsaFJibmxsUytRSDVF?=
 =?utf-8?B?SWxkbTA0V3lSeFBhUUR2TWRjV2RqcXUxZVZLa2VaeDlOc1VRdXIvazZYVFBL?=
 =?utf-8?B?SzVkblhuaFJjZ2FkR2lLNWRlVHplbGVnNjJ4cVFKWno0YlJZTkQ5UGRKWlFZ?=
 =?utf-8?B?KzdLOE5RbWFFSWdzZVhMSmJMUHNLSmxvRUtqamhlNVZTM0lGUmNsanFCd3Aw?=
 =?utf-8?B?RUoxR0RhK3hSeVdUUjlKMktnVEFPbUFRSDUxOHZQQkE4SEFxcnVobldlNkNt?=
 =?utf-8?B?ZFpJMWE1ZGhCRWZBVFlrdGFWSnBIMXN6MHptK3JXZUFNOU1lb2lMVUVKdVg4?=
 =?utf-8?B?R1ZsclNYSU05ZUtEQVFBWWUvUVVxcnFpT2JPRFFHd3F1QnpYZWZxcWQ2Smxp?=
 =?utf-8?B?ZS9CTE4vVFBiZk54NGEvUGtiN3dDbFVZSHBKdDJzaituSWd5UGZRN0tBNUxw?=
 =?utf-8?B?N2xiMGs4U0tLRGJwQktEQXB5bS8wOHB2Nm1ESTBwcUN6WjlEZ1FIY3hJd2JP?=
 =?utf-8?B?eWV1QklXNUdmSUovR1FBK0dkNDN1WUc5YUZsSmhKTnk0aFpRY096TzV6L01Z?=
 =?utf-8?B?dUIrOGp4VDFha3VkZ3AvM2g4MVhxbjFZRVRkSXliaXdHaVI0OHM0bmRjVXV1?=
 =?utf-8?B?S0Q4NVkzbXhMbDlkRWNtVHFPYXhhcDRoSHJscFZOSlIxWWkrNkFPNmxjdjhW?=
 =?utf-8?B?UXMwT2g5eFZ0RzdKL0V3YlNJU1JFaXk0Q0Q4eFh2Kzd5eEJURG9zL2FweWox?=
 =?utf-8?B?TmZMNEtKU0R6clcrNHgva1lLZjJWRDl0K04yMG42amt3R0dCT3NrdjFzbjZh?=
 =?utf-8?B?M0czR3Q4YVRybU9BeE04MGc5ZlpXa1djL3RNc2Q2ZHpaRWl3SUVubjF6ZlpS?=
 =?utf-8?B?VUptbzJXeks1NkdmemhpeFppZXRKb1NaazR3RzBidU5LM1c3cXVjdVU0MEF5?=
 =?utf-8?B?cjE4bjVyMzdPdERlVTJFUHUzbllVU2w3R3dxUUlNd1M0d1ZlMW1JYWFBRitw?=
 =?utf-8?B?eDQwME5Ock11cFNlbkRFV3BraGhEVzkvREpDaUNJU0NTYWtJZkY5Z3FwL0I5?=
 =?utf-8?B?L0dObUJaeUVtV1NnK29QTUVFcllxaVNHemU3WGJEZEtnYzltWCtMMnJ3WU5u?=
 =?utf-8?B?ZWRnK1JzN2h3UFJDcWxRWnJ4RmxtL3hoRWgyQ1lZQUE1VkoxSEV6UTdHTTVO?=
 =?utf-8?B?N2dxM05vNGNvS01ic2ErYXR6cUJOR2NNd3h3V2tBeWpJMklxVTl0a3FxR2hI?=
 =?utf-8?B?WFBDSi9PTVZjbDVMQy9LQ0lsSkdjWGNzZGpKWlBTenNYcisxeW9pVDh2N0lw?=
 =?utf-8?B?eU9IdU4zaklWQ2RmK3pwakduU21tY1BEOStzdXdLSHN6UVlBYzkwdmZhSnpT?=
 =?utf-8?B?S2FqdWp0djNzNGw5RkxxUUFhcDI5NkpsNCtVMGprclRWZjNaR25DWGxyUHJI?=
 =?utf-8?B?WndmZ3Q1ckEzd0Q5RVRuR0dQbGR1c2ZNZ0d6eExxT0VYYzJRSUdOL04zTzI2?=
 =?utf-8?B?QThCRjJOMk53OEZseXBqU1JWbmw4Q3hFQ1ZHdDNIKzF6TGJvd0xIUXlaQi9M?=
 =?utf-8?B?Y2NobzlnajV3N0Z6Y05OcGRtenBERzQwSTRrd3loVTR6UWE0bFlkeW9rK3hi?=
 =?utf-8?Q?jdvJEAS1uX6e/7ZFyvraclZlvCXSn9brjX3FS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3180411f-12ad-4034-57d7-08df2e812a9d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:07:21.2264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpr6i2pEkJAcTz4CacZTzQBauPVDpwyMf3Nhf+wMMs6KgUKmhgdqhU58rin96I2BTku7mJsHhoRsUXcDRRFzFwqBnggYqGP9EqXpWIAqX2DowN1SfpJ/SGwSOnXTczMQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7534

On Fri, 16 Oct 2026 11:05:22 -0400 Frank Li <Frank.li@oss.nxp.com> wrote:

> On Wed, Sep 30, 2026 at 06:42:23AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [High] dmaengine: fsl-edma: kernel panic due to post-registration dev->bus modification
> > - [High] dmaengine: fsl-edma: probe deferral masked in DT IRQ lookup
> > - [Low] dmaengine: fsl-edma: compilation failure due to undefined function and member
> > --
> 
> Need fix these sashiko report problem or provide explain.

I saw that, but I mostly focused on discussing shared SID support for SMMU.
so delayed V2. Hope it could be ready in this week. 

Thanks
Peng

> 
> Frank
> 
> >
> > commit 7b47892ce3017d20fbf0bc531e1531f30816d5d2
> > Author: Peng Fan <peng.fan@nxp.com>
> >
> >     dmaengine: fsl-edma: support per-channel DT child nodes
> >
> > This commit adds support for parsing per-channel child nodes from the
> > devicetree. It configures per-channel IRQs and IOMMUs based on the child
> > properties. Existing devicetrees without child nodes continue to work as
> > before.
> >
> > > diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> > > index d9fb717b5b53c..e7e5b33cfcb20 100644
> > > --- a/drivers/dma/fsl-edma-main.c
> > > +++ b/drivers/dma/fsl-edma-main.c
> > [ ... ]
> > > @@ -695,6 +699,133 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
> > [ ... ]
> > > +static int fsl_edma_configure_chan_from_dt(struct platform_device *pdev,
> > > +					   struct fsl_edma_engine *fsl_edma)
> > > +{
> > [ ... ]
> > > +	for_each_available_child_of_node(np, child) {
> > > +		struct fsl_edma_chan *fsl_chan;
> > > +		int ch_id, irq;
> > [ ... ]
> > > +		fsl_chan = &fsl_edma->chans[ch_id];
> > > +
> > > +		irq = of_irq_get(child, 0);
> > > +		if (irq > 0) {
> > > +			fsl_chan->txirq = irq;
> > > +			fsl_chan->irq_handler = fsl_edma3_tx_handler;
> > > +		}
> >
> > [Severity: High]
> > If of_irq_get() returns -EPROBE_DEFER because the interrupt controller
> > is not yet ready, it seems that error code is silently dropped since
> > only irq > 0 is checked.
> >
> > Later in fsl_edma3_irq_init(), if fsl_chan->txirq <= 0, it tries to fall
> > back to platform_get_irq() which will fail because the interrupts are
> > defined in the child nodes.
> >
> > Would this cause fsl_edma3_irq_init() to return -EINVAL, permanently failing
> > the probe instead of correctly deferring it?
> >
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int fsl_edma_configure_chan_iommu(struct platform_device *pdev,
> > > +					struct fsl_edma_engine *fsl_edma)
> > > +{
> > [ ... ]
> > > +	for_each_available_child_of_node(np, child) {
> > > +		struct fsl_edma_chan *fsl_chan;
> > > +		int ch_id;
> > [ ... ]
> > > +		list_for_each_entry(chan, &fsl_edma->dma_dev.channels,
> > > +				    device_node) {
> > > +			struct device *chdev;
> > > +
> > > +			if (to_fsl_edma_chan(chan) != fsl_chan)
> > > +				continue;
> > > +
> > > +			chdev = dmaengine_chan_dev(chan);
> >
> > [Severity: Low]
> > Does dmaengine_chan_dev() exist in the kernel?
> >
> > It looks like this might cause a compilation failure because the function is
> > undefined.
> >
> > > +			chdev->bus = pdev->dev.bus;
> >
> > [Severity: High]
> > Is it safe to modify the bus of an already-registered device here?
> >
> > Since fsl_edma_configure_chan_iommu() is called after
> > dmaenginem_async_device_register(), bus_add_device() has already seen a
> > NULL bus during registration and skipped incrementing the subsystem reference
> > count.
> >
> > If probe fails or the driver unbinds later, device_del() will call
> > bus_remove_device(), which will see this newly assigned bus and attempt to
> > drop the reference twice.
> >
> > Could this cause a use-after-free panic in the bus subsystem?
> >
> > > +			if (fsl_edma->drvdata->flags & FSL_EDMA_DRV_TCD64)
> > > +				dma_coerce_mask_and_coherent(chdev,
> > > +					DMA_BIT_MASK(64));
> > > +			else
> > > +				dma_coerce_mask_and_coherent(chdev,
> > > +					DMA_BIT_MASK(32));
> > > +			ret = of_dma_configure(chdev, child, true);
> > > +			if (ret) {
> > > +				dev_err(&pdev->dev,
> > > +					"IOMMU config failed for channel %d: %d\n",
> > > +					ch_id, ret);
> > > +				of_node_put(child);
> > > +				return ret;
> > > +			}
> > > +
> > > +			chan->chan_dev->chan_dma_dev = true;
> >
> > [Severity: Low]
> > Does struct dma_chan have a member named chan_dev?
> >
> > This looks like it will cause another compilation failure.
> >
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> >
> > --
> > Sashiko AI review â https://sashiko.dev/#/patchset/20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com?part=2

Sent using hkml (https://github.com/sjp38/hackermail)
