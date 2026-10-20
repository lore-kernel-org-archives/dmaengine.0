Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792530518;
	b=zarQNho8sdpQHaLMy8HKdtMF3+sR1s1BKVuN4r+VM16jqXcWg56RIMzsI1WLZIur/HJM
	 pHLcSn4qTgPDiI1zwi1uLpdSLVUfnANd9QEGOw+Stc2S9hQPGxFmaaaGcvTYpSQO/3SB0
	 5VxVP+QGISns+zRZNXBfVdkDziuJFEFHe7uJridKNQseoOe04ifhyZSvJA9wKGdJKUWW8
	 75cNNhqPPgy/GP4Zq/lqKmFKuyiNST4rYyKDWAJJLkfO4hx/GAlvcpDIWu+GmMXKDWVBA
	 0y+uLwKe+Iz1+FPXHYvq8ttdMAHXnUCQ1q4tBx7P1bEnndhLA4u39TVCaMVx/cX5Otw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530518;
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
	bh=W9WmSd001WcMoW6/ejk2Nntumf0uE2tWkF7/9LSa+yY=;
	b=RKypll6iGgv/JnuihBmkhnRKId0/QE0a42thE3TsXBuiarBpAeBxsiriQ0qHHMADwCHr
	 HTQoMKymrVwO7UicR7cypOoGU+bNkgZpsLZiOv4kA6mSaBCvS1Cz2AFN7hHsuiNmPzZHW
	 mXSTZbewSQwoX+Q1BQ5OZpFnS9+aU2vAhHyMFsGI5gEZijFPacT67+EZl9yNlYlSVKeyV
	 lGrfw3jPq71/FWf9EH2gGxgko8lVa8HD8uFAnRfIhL0ZRFKjFvwb/alB+Mp6rnlCv1Km+
	 Icvo+RvIEaNH+XFRzLBT4dLklz5peH1Jzu12Uws2/rWMymsZJxBz+hsacd24ppQBxCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XV136Nf+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.61
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013061.outbound.protection.outlook.com [52.101.83.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC514606A319;
	Tue, 20 Oct 2026 21:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC514606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XV136Nf+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+OyGkBQuj2Xsq1+3b2q8jvh76tWW6p8YqDTTFIPKy5DcKSGbvEL1t7/ZNAPpJ4b9lAfC2Quown48U1BdDRs/KP96o/kXxKo0BOsfA3GvuHis82HwcCol5ilerOGu9xMgBR6CW5wRnhvMyXmNNX+5XR8ibNFw0eq+NxqSK4QXecqCp4S3Cob1Y2W9XvUSU39gTKGWc0ma/91bJD7dEHuG4mz5pI252NvsfFUSgko/GS2iBk2Z3l1aCioq/a3TJeVrO+EOhzDNdsceFf/LOBkEWEuh5u95gedu1n2dQpjlgOC6PcQDYPYGFUUARz0i/rCmqPmF2aGzPyS9Av63+LwSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9WmSd001WcMoW6/ejk2Nntumf0uE2tWkF7/9LSa+yY=;
 b=fRrSTvoB6Z4LCVuLiXy22oZDMmt1kmSHSFRera3TmwRnaFFQKNyASRWA2uJD2FG7UJGXtxIU8NkKjCq2/KSu9UYdxFtZXZQvSPYWTAjioXcddYw/RWFzfusDN916zfRYpibWKcQdq6sSc/Nt8SRy/CrBNEzDFeuJEDFsSd0goU/ctFcpJAA7IXcXoBkDokvpIQkmu+fhaOylNDo8U45516H0PcV0UQQWGvvMwVA6YiiudSpw5iziU6H8K67beUIVSFXukhmmBEMPH6VX2OlmqteqEX4bS4lilGuu8xQZiG66hM/DWUd6jxlApyPS0QYRnStvhX+YqP8lFkth19RRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9WmSd001WcMoW6/ejk2Nntumf0uE2tWkF7/9LSa+yY=;
 b=XV136Nf+ZLYRqEKBLKy3l3lWMkOSpE8Lgn2UOznpvtAAb95YDwt7UxQzl1CDst2m1gbTDv7an9/PO0R02SQrULSgr4NK+79fRpu6vrp1FHsftBECfohntpYMZ2gtf4BV0tDSuoDb5KYaUpf91PBNFhQTlgxObGAc+L2mYfuHt8EhQOV+FQj22NPgWMMUueSsfM6LVjadB+9ZqqZnXyzQ5PHZWZuqS0JR/dGb+y4GwAXSCvo0vuofXqoT8NtI9AFPqVpvlKOJenTGQVlVbvxcySPyjw3y8JrKV336qC730z5f76/NQ3qU2+fJ4WioPb1Wl5quHunXbopdadNIuk2yWg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7900.eurprd04.prod.outlook.com (2603:10a6:10:1e8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 21:08:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 21:08:33 +0000
Date: Tue, 20 Oct 2026 17:08:26 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Saeed Bishara <saeed@marvell.com>,
	Lennert Buytenhek <buytenh@marvell.com>,
	Maciej Sosnowski <maciej.sosnowski@intel.com>,
	Dan Williams <djbw@kernel.org>, Nicolas Pitre <nico@marvell.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: mv_xor: use writel() instead of relaxed
 variant
Message-ID: <atfYShWWp0DTGj_M@lizhi-Precision-Tower-5810>
References: <20260916182405.12985-1-rosenp@gmail.com>
 <aqrowa1TFhIDA-17@SMW015318>
 <CAKxU2N-zLp3612KRsdmWKjm2hMBOikBZDBEqvpLOxpg44J4Fwg@mail.gmail.com>
 <aqsZMeDZShMpCVj_@SMW015318>
 <CAKxU2N-KfzS3uXRE6GKy2FL2mgrfXwbHaZx21ynhrubnGkJcvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-KfzS3uXRE6GKy2FL2mgrfXwbHaZx21ynhrubnGkJcvQ@mail.gmail.com>
X-ClientProxiedBy: PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: d707024f-6375-4e2f-b90b-08df2eee4cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|19092799006|366016|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	4y3jOwmjQrblNVXqWihpJQkyurUcuOLkDu4mtcMwVm3k/oxPN5+n66jwje9rIh4LZeur2Y7es4VYQskHvfmfPY4EPdIGYEpd/26z/H8BfAXNv9tY88QC12gSc2yHmeRSBbIwW+CpXjXQ81sUCq9Bf0hpfGZc1EufttKCTMppcJLmLWIz0ZR87GUCEporcU3t0TXh3XrOLe4RaoUlzDaOkbc71u7/1dvCNkSNXoBAI9ceXk3cuw4rvxmGhE9DOmOMXmv/29MLGCoTkTOM6kn7TY6NbxEE9eNNGp1GwgdTuBTg9fY1GqVFt5WL7XdDoA5Sgox8cRy+fY5vFtWNP2Zj71ryF68ERL3ia7hMTyryZEq1J3vi7hRDwsPV9CfLWUYj7VKlscOTKW3hbxZJ5v2yodnwJBt1PZsn9Iu5d7ajnlnYTpT44t3Tk4/46fSll+Fv2eMXTxowD4FyE34YicFt2kURmgsIDp5MxRihEi8GBWGb2qFm0E4Y67/QzPXxdKOpLVwSMa/d4bc8MfHibDkBs58VA2Hjt9QEBhX2UT+9gGjb+g7Iu0eXoA7V8oPFBp73SxHIVChAVuIcYMjsN9CSTCdPH0EzbsY2VVp3Dhyw84lY+oajH8txBHMTekpKN7FVXe+7oLP3uohhbKaqFls31DYDtxcjpU6dagzCgQlbSa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDB2a21raGNhSHJMT1JCMzhXUGZsVzVlNGI0RmMwTDdqRTdqaSt4NTk5TEJI?=
 =?utf-8?B?bnQrZXZPYVN6L2Z1UXptbFlBMG05ZXJDNmJWVEpaNEJNeDNZT0VnZDQ4TzBj?=
 =?utf-8?B?ZHhNcXNPUTF3WnJtUkpYQ2tBUS9lVW1xWjNsNFV4eElZK2c4ZjZHZnlkK0NH?=
 =?utf-8?B?U29Ec0lvbi9jZng0RFZGQ3AyZCszNjNPU3duVVgwNE5GeUw0Skp2bFhyYzlR?=
 =?utf-8?B?WTBsSXRSTGcrSmhjN2RUWGNhR3RTMCtOSVVNd1ZhYS9nTkJWamJQSVNLYStC?=
 =?utf-8?B?NmJTd0JCYUl1NzNldVZwdFo4SlRUVlZIVGE3TzZET2RxSG56RldsVlpHYStv?=
 =?utf-8?B?QXNpeHcwa0RrMlBPRGJWOHpJRHZuOVBzVmVnRzJsZzNzYVBJK1B6dFVtMFd6?=
 =?utf-8?B?czBBS0dKV0VROFZXVkREU3d0OXFlWlZJUVJ6dG5KcVFTMjZ1Vk5remRCZDZW?=
 =?utf-8?B?V2dxWGRMR1BKTmtHcHZOdnBZM0ZCWk9KSW02RFZJb2lkM0Y2SytrNlV4TEt3?=
 =?utf-8?B?Umg4bk50RnI0NndBVE4wZ0NvSU16bEtIa1RiTWphTjFGeGUzc3dTdHNYQnhx?=
 =?utf-8?B?YU9FdjJnUHlLTHovbElqT25Jdy8vL2RtZHV5MVNoMk1GSkxmMVNCTkNrT2hk?=
 =?utf-8?B?NUo5VHMxQlZhUnY1a0ZLeU5OMEIyRk5ES3lOeVhLQy9XRFRBZjlsT0FMam12?=
 =?utf-8?B?WndhWk1NRThMTGJsaXZ5ODVRWW9WTHdPaUhlajZiWnpJOC9OTE96TDZCaTl4?=
 =?utf-8?B?QmVld25wSWszUGNkdDJYUmZGenBzbU95bU5HcER5N2N1Sk5Cemd4R3lmcXdI?=
 =?utf-8?B?YnRNNDVOZ3pmUE9CUWtNc0hqMDd3MEpNdmFteldEdi84NStUK1Mxc1ZyTlkr?=
 =?utf-8?B?WkRKdDhpcmpVcWh1L1V2Z0wwN0pRWkI5SkJhdGJTdXVZM0FTaDc4WGp2TTUr?=
 =?utf-8?B?L00yMmpnM0IzVk5JK3VHZWM4WVhVQ2QyQk1SY016Q1U0QnhZVFEvRmV1NHI0?=
 =?utf-8?B?cUJhTDU5TGxmeDFybnRsMW9SWnp1bXRJWklqTlY3emNWeG5WdFRwVEEwVDds?=
 =?utf-8?B?N0g0U0NTaGxBUld6TkdxYWo1UGZndEUrdjVBS254cmNvMk5MaERFMHJ4MTky?=
 =?utf-8?B?dG5jbkREUXkydUpOZnU1d29tNTdFREVGbDVsaDJFclJ6T3pFL3RpZjBaOGQz?=
 =?utf-8?B?S05BUUo3c3FXVEV3czdFMXREOVcrZU9URkpjSkkvNW1NcSsrNzQ3UkZyQjlT?=
 =?utf-8?B?UjBySG84eWF5WGNoYXBwUXlINng5eThDay9RYkMxYmx0YUZTUmk0VjFiYUJm?=
 =?utf-8?B?d1lyVVJCVUlXRTE2TFlFQjJsbVdmK0FqZ1cvaWh3VkdPdGNXNTdzdXFDZVla?=
 =?utf-8?B?alhPcnlQK1pEdzAxY1pESmhFQUh4OXB2aWF6eVBxL0ZhRmR2a2FvVEJRTW5a?=
 =?utf-8?B?eXExUHZsR21adGJVb241L29MNEhVdDd3SzVRbitrb00yMXpPVzhsSFVXaDlS?=
 =?utf-8?B?VTR4N0U2M20vcTFReWtjTzUxSnQwbjZFdGxUekM2MW9iR2duS2lycnU5OVRy?=
 =?utf-8?B?YWNYRzI5MWdkZUxFNUVkdXJDUEU1ME1LVDg3T2tUeE1sQkhHY1VXZktQNXgz?=
 =?utf-8?B?N0FkZW9xTEdiWEkxUFUrOVM0bkRJT0NEY21LUjZFd1lSWFdaT2lkRVN1U0R5?=
 =?utf-8?B?SWc2UjNVYnpwbS9yVTJNOXE1eFc0VXR4THY3Vm9kNWNaZEYvd3NMblVRa2Rx?=
 =?utf-8?B?d1dBT2huNmdiaTJmRlprWmc4aXRzbUdUMjV6ckNzdUtSbGFOTHRNSXZOUXlB?=
 =?utf-8?B?b0ZFUXBhaXV1K2JMelpnbkROMjJma1dhR1VGTkg1Zzd6cmdTd00rTVY3TjRN?=
 =?utf-8?B?WnJzUGZKTEhETnhhdklYaUtKQ09KSStXSzBST244UUhVRTRXU2hta1J4Nitq?=
 =?utf-8?B?dzRwV1hDWjdUOU1VMGJZQ0ZYeGRkc2cvTzdNdWlrTFdpNGJndSs5TmhsckJu?=
 =?utf-8?B?a1ppVEtCTmI0VWp0QU12YmpLQVBqaG05TzJ4WE15UU1XK1pVOHkrYS9Bdmdp?=
 =?utf-8?B?dlFkNE5Bd3hpSkVrNEJ4OTJIYU1LZTZyTGY4Z1gzYVBDNGlPK0xBSzRyUjNr?=
 =?utf-8?B?UmhDZVk1Y1A4N1ZmVm93eUtCU21hVU85RWJVcEVIblZTYWdPV2d3WFQrRTlK?=
 =?utf-8?B?S0wvS3VDMk1vRXZjdkhFSThhZXRzVDcxYXlCTXc4bVlBOWlQdzEwNy9NWUFn?=
 =?utf-8?B?UnkyRkFBWVRSbEZSWUY3NzNFOUVFemh4YzNzUTVMc3RJalQrM1dEZHN3bDk3?=
 =?utf-8?B?ZFVIVDhmUFppRCtjT0hUQlF4RDltdjFxRjZ6ZVJ5ZnhQcVRxNnBBYUpIUmRO?=
 =?utf-8?Q?Eha8N07Ft2ah4ontWAh8lP5MdBe4P5/qiLivn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d707024f-6375-4e2f-b90b-08df2eee4cd8
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:08:33.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lptMo3pcYUBShEqNU6FOUUvupRsW/3m7TRCiThl117JqXvY8sR4MyQd4CxiniRWeSfQLu2X3oyPYJDRHwGb45JoJ0Nd+yJ/Zm300B/jTlZVqNVmP5YYLy2BToyhXTNdF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7900

On Thu, Sep 17, 2026 at 04:45:31PM -0700, Rosen Penev wrote:
> On Wed, Sep 16, 2026 at 3:33 PM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Wed, Sep 16, 2026 at 02:46:34PM -0700, Rosen Penev wrote:
> > > On Wed, Sep 16, 2026 at 12:06 PM Frank Li <Frank.li@oss.nxp.com> wrote:
> > > >
> > > > On Wed, Sep 16, 2026 at 11:24:05AM -0700, Rosen Penev wrote:
> > > > > Fix the ordering guarantees between descriptor memory writes and the
> > > > > MMIO accesses that expose them to the engine. The descriptor pool is
> > > > > allocated with dma_alloc_wc(), so writes sit in the CPU write buffers
> > > > > and must be drained before the engine is allowed to read them.
> > > > >
> > > > > Program the next-descriptor pointer with writel() instead of
> > > > > writel_relaxed(); the full accessor drains prior memory writes before
> > > > > the MMIO write.
> > > > >
> > > > > In mv_xor_tx_submit() the appended chain link must be visible before the
> > > > > busy-status register is read. Use a full mb() so the engine cannot fetch a
> > > > > stale chain link and stall the channel after the CPU decides it is still
> > > > > busy.
> > > > >
> > > > > Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engine")
> > > > > Assisted-by: LLM
> > > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > > ---
> > > > >  drivers/dma/mv_xor.c | 10 +++++++++-
> > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> > > > > index c4e0dce3ca64..0de2b1ad5c30 100644
> > > > > --- a/drivers/dma/mv_xor.c
> > > > > +++ b/drivers/dma/mv_xor.c
> > > > > @@ -103,7 +103,10 @@ static u32 mv_chan_get_current_desc(struct mv_xor_chan *chan)
> > > > >  static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
> > > > >                                       u32 next_desc_addr)
> > > > >  {
> > > > > -     writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
> > > > > +     /* writel drains descriptor writes to DRAM before the engine
> > > > > +      * is pointed at them
> > > > > +      */
> > > > > +     writel(next_desc_addr, XOR_NEXT_DESC(chan));
> > > >
> > > > I remember this my comments before, should be v2 version?
> > > >
> > > > >  }
> > > > >
> > > > >  static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
> > > > > @@ -410,6 +413,11 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *tx)
> > > > >               /* fix up the hardware chain */
> > > > >               mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
> > > > >
> > > > > +             /* make the new link visible to the engine before we read
> > > > > +              * the channel state, the device may fetch it at any point
> > > > > +              */
> > > > > +             mb();
> > > > > +
> > > >
> > > > The first is readl_relaxed() in mv_chan_is_busy(), all io readl and writel
> > > > is ordered.
> > > >
> > > > which part need mb() here?
> > > It's to deal with readl_relaxed in mv_chan_is_busy. I'll change to
> > > regular readl in v2.
> >
> > I just want to know which variable need read barrier() ?
>
> Review says:
>
>  #### Validity of mb() after mv_desc_set_next_desc()
>
>   • Ordering the memory store (old_chain_tail->phy_next_desc) before
> the MMIO register load (readl_relaxed(XOR_ACTIVATION) in
> mv_xor.c:181-188),

According to Documentation/memory-barriers.txt, read_relaxed() order
with writeX for the same peripherial.

mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.phys);
use writel(),

mv_chan_is_busy() call readl_relaxed(XOR_ACTIVATION(chan)); readlX() must
happen after previous writel().

>  is necessary to prevent the
>   CPU from seeing busy == 1 while the link store is still in the CPU's
> store buffer, followed by the hardware completing old_chain_tail,

It is impossible. readl_relatex() guaratee get register value after previous
write data reach finial taget place. Many place use the same method to
guaratee previous write complete.

> reading a stale 0-pointer, and
>   halting without the CPU restarting it.
>   • Since readl_relaxed() does not order against prior memory stores,

readl_relatex() don't order against prior memory stores, but order
with previous writel()

> and dma_wmb() / wmb() only order stores against stores, a mandatory
> full barrier (mb()) is the
>   appropriate barrier for ordering a normal/WC memory store before an MMIO read.

simples said, io read and write is order itself.

1. mv_desc_set_next_desc() writle(),
2. mv_chan_is_busy() read_relax(),

1 and 2 is order, all data if have dependence, it is also order.

a = readl()
b = a * 2.  >> this must happen after readl().


Frank
> >
> > Frank
> >
> > > >
> > > > Frank
> > > >
> > > > >               /* if the channel is not busy */
> > > > >               if (!mv_chan_is_busy(mv_chan)) {
> > > > >                       u32 current_desc = mv_chan_get_current_desc(mv_chan);
> > > > > --
> > > > > 2.55.0
> > > > >
