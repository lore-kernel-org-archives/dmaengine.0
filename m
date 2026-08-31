Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EEC3F58FE;
	Mon, 31 Aug 2026 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179188; cv=fail; b=V66O2Be/eMmi4vFe4hpdsEjKELozT7NgScbgUfxxmq29Lg+VmZ/QvIAywYbQKbVBtJK/v+/vGTIyocGDnxqZNJGgIOB9agtHVBXQT2s06ftt7yvlQ2Ks1NwXPVeSEoatYrC3j18aMo4F+BBdl1zjOsKU84IJ5tHc1mmLrHcmLtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179188; c=relaxed/simple;
	bh=K9jYt35j8LnysqWVEc+Ep4+3QKVzlpNmTMonV+ZUViM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o+mLtOYvArslMi0fcO/uEcpNBfbOX8IU0/pmpTulvzh/bnDZ0TfMafuamR6EQPBwG8npaNwnXjpaFt0gySiapdFZ1xuF9QMx/TsZuVq/KUk02uiSniFrCFbkUQ/vN88dSAhqRrvz6Go9R+MJ9f9qesChauarmURUyKG7ojmMOqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=tONHivbz; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="tONHivbz"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBCxlV1420170;
	Mon, 31 Aug 2026 08:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=0BgLe
	ONWWeZ/xDyRkXOZUuVXxaK04J1OnAQBpEsJpsg=; b=tONHivbzHAKatZFLflVgB
	xfaxIxf1RObmUOQC45be6YdQR0XkPI+5BswO7edm96otCD0qrUqmvV0Wo4jTWyLw
	jR3AhNeLOpoC5xnvrGZekRisAdKToAZ+R97Pc7Wj99Ecctj9cl27NY6ci5mdBE/8
	MM48o06WeU1qp+gW/cEWU6LCyNJ/LSXtescqdk0z+nPklV9OUQJ5MQ/YdQIsyMry
	PNiCT/mxjPVb4xgTVoFo3mj/NXcId+brFcHcGNHpZttKRKH1s/VGpU+k38oTzFFh
	PVKvJJu/RnEtXQvtjo+f8F3N/KCx7S6ALCkojoIuZlbpRng7IXnbF09Bw2j29tFS
	w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gcgrg4897-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 08:26:24 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woL0tYnxI6QqTiWfSzIl4OF+csjWsW5BBuRGpRt1GZbTyZgZHmpOoHIBGFHcYM0PorKKDni8kFRVSTEG5gRd7JZsfietBEeDFKl7WuUHBfsp2iclCcdVuUO3Ki8duN2W6FeKT9r8Y7hEY6FJYuxMO6RBoCjrte2L1Y7txEhOT8LKZ1uR7M1ei+kdFS9quwCJwiMWz8B47vHiM0XPAT6VK0y1lOxFv9C+zf8x760wHxSbDIUWn/8VUwWF7Rs72J5zeSbhsWdUrSHLP2ALbguOllRndqm9Hv8yQYyVcMeX3k1QPIASABZnvD8qzT3zMoJp+8kCgNnCTXJQzcCAWHJzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BgLeONWWeZ/xDyRkXOZUuVXxaK04J1OnAQBpEsJpsg=;
 b=k2QwfDP8fspwgHJu+t5NKAaCDAXkA+APBWtOrZ2gipqeU7OBE1YOAy0kTbhxNShQAPQxESW8/5zAlEH9A96N4T2D6zDRptoHSfCvcc//gvX+tyw1fzy9/PzMf7cwnLd5vcQ4eblgASxmYwRZUFhk3LPBjHltQ9C8WaoAdDruhT+4DlcRH5Ipo+9Cvqp9+pPN9zDgy7AyFyRrHdBRKYCWQoPQFozGBhTwXLWexQGdHXEp6MIxCKUVprsnpdEZEnTZrv7FVVuZsQIeBHb4zCMd09T83s2i6hlMTW8gQCnK6CPep9+hd+hMMitOdqAKkw8BCdOuIFTjy12g1eJaHgRaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SJ0PR03MB5663.namprd03.prod.outlook.com (2603:10b6:a03:27b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:26:22 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 12:26:22 +0000
From: nuno.sa@analog.com
Date: Mon, 31 Aug 2026 13:27:35 +0100
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Subject: Re: [PATCH v3 2/9] dmaengine: dma-axi-dmac: Use bus width capability
 helpers
Message-ID: <apVzBTBI2CP9eiBi@nsa>
Fro: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-2-507d97496f2d@analog.com>
 <20260831120112.07E861F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831120112.07E861F000E9@smtp.kernel.org>
X-ClientProxiedBy: MA4P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::19) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SJ0PR03MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 68bd2c95-97bb-4d28-d532-08df075b1113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nNEp+XS9GSHzJ+GdOqZxvpqBq8tAyRL5Jsqb6M0SzuJcH11yhcWfh2p5vjUBZ0IHXL6ZqcbeNRNCd5BYUInjJ79UTT0pF9w4zPwuSNnBeyBDR9zWY2eD0LrdL0BEl/KJy56AhlsOpuBNhCJk4AAcMMzW5D3U9yCQAIO2DO4HpuKD9rOc4uGDyIwfuoDsJfwZCkE4RXdxgW+cHyioGROQ0hfCmTZTXAqoX6gndElSoNCkHk2LDS0w7LBXnTxSLutxVvVfuKSDYwDeJ0Cg8Vc/oz1sjmH1m6GZWB+aXj9Z4HTQfyb2JtAM89ElnT3edlQuVUy3/wIl8UqpzDMkMzVqygTQas0h5qw4namVW8Ln62eqNNyokmcB5JRdBjfoDuVsj1W1TGnefBUvrm4BMApcsQ57KQ6VUWx+tFy8I1O6Z78MrmGAnLEOFKizGxVncKoicdQRsPuXVORlD4IgJjkPtYUeFMcHx3W2buxzKVilkT4PffKcADbTVi7qP4itiH061u0wdNnFuNkL6q6CEhXO6TOZ7gwXMKEmaaqluIE6QaPh+NYt1fM1Hf5YyxGnLHoivEnGh2npL6EUSEa8D4rKv5Z+KIiIoJtDEdesdr9t3a0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1FndWdia2JnRHRYMUlLdEh0WVMrOVFaRXgrRTcvanprNWNSRVNqSFI2aFYv?=
 =?utf-8?B?MjRsZUJyOEROeVVHU1JwY05nSmNMdW1WVFZBUWR2S2R5SFZMQmhqeFRhMGdM?=
 =?utf-8?B?WWhOYUd4bTZkZ0ZKa002SEw2eW9PMVB5YWxuc0VGTkVpUjNxQ2Q5Q2dNZHBo?=
 =?utf-8?B?THhlUkM3N3RBVEVuUU42a0hIdy9LNXNmSm03YndCMGVSU2c1aVZBVFZJd0NQ?=
 =?utf-8?B?TTZmOGpwWjMzLzZxWTlWcUhZL2psdXIzZ3VBV2RTUzgxY3hNU3BSbVlXbjhZ?=
 =?utf-8?B?UnBjZGU1SVJpR2NMcEdkeWF4UTFrUkpoU0EvZTd5ZzhlaFJvZ0ZmMXZ6cDkr?=
 =?utf-8?B?ZXNQZVRsWlhESUFiRFpacVBIbTJjNk9VOGoyb3pIZERrUTJ4Y1dUbWJjaGsx?=
 =?utf-8?B?NUdPajJqaTE0eXlDSHRQMkd0ajhvTXNseVZYRzdaVjhlck5jYk9WYnovS3Nu?=
 =?utf-8?B?R1hhWjFDa2llOE9xcU84WFZ5QVhXQUk3SWdtMGNKcGtGTDMrczZnMkc5Rks2?=
 =?utf-8?B?RFg4Tk92SDlaQ0dZVEtJNUJRa1JLRU9VTTFDa211U1ptTFZiamdEeGdvajRt?=
 =?utf-8?B?SGErNXR1Z1ROem5tNkgrT1VYbjc0NzJlU2IrYSt1LzEvOWY1anBucDJBOG5i?=
 =?utf-8?B?azRkZXRXWm1hbkVOSkJRK2FFZUJiMUtJd3pTdHpGdlAva21pZnNZa3Npay9C?=
 =?utf-8?B?NGtlMVp2cFoxNXYvNmJDTlE1OXhwbk8zVHZ1ZFZVUlowY01TRXQvZmdhdE5Q?=
 =?utf-8?B?eGVYQ2JUdE9veVBYeUkrUWVBdGFUQVozcldUeHNYQ2xCWXhnOFdyNW5kZGlq?=
 =?utf-8?B?bzdvekdpbjhYbHg3Sm1oeEh5U0JPVUlRUzVyNkV5Rm5yVDlXK2tqZXRzb245?=
 =?utf-8?B?dkdlRmlocGZYMVZlLy9XenM2NmMzZFZoY2d6UU0yWnZLM1VqRDBPZWFBWEZT?=
 =?utf-8?B?UFowQ201bllhTjlocHo0bDM4OGhtT3Vlc3dvaHZ4RmwvQWVxcXNtNnFnb2hY?=
 =?utf-8?B?MSsrUExGLzJyNVRCaE5iRTFqTEp4OHJHL2pmdUdaQlpiZWxOYU1LaWVGWGN2?=
 =?utf-8?B?bEM5OWxUNjJaQWRNTXBFZXhXRGhkbjVUWURTemt6NnJ1dGVkTEM1WVVQcFR5?=
 =?utf-8?B?RU9VQ0xnSE5sRkRQd05PbWxGNXRDUWViK2UweU92TkxXYkhWbndUaEMzOGNF?=
 =?utf-8?B?NFltUDg0UEx0akkrUVdvakNvVUczc2xhdUhVSEdSMThRV2RwYnM2VFpKUit0?=
 =?utf-8?B?b1BsZFRYQ3VWZ2tvTDl6RVI1YzdMTjJocy9uLzROQnBEd2E4WFRFN3BPU2ha?=
 =?utf-8?B?TkUreDdoZ0RJV3E4VnNwK1lPRFlIajJ6NHNwbW55ZjlxYVhObjN2SW5pd3U4?=
 =?utf-8?B?VFU0c2RyVnNRMnhXRXoxQzlWOTdBYzNFQ0ZUM2ZjZE93TUUzK00rbDlUeTdV?=
 =?utf-8?B?amlBc1k4L3Azdmw3b09QQzliR0xtQ0wzY3ExN0t5a0ZUMm5LbnU0djlHUGtR?=
 =?utf-8?B?ckkzU0tkYjE0L0JWUGNaK3hLa0ZQUFpQSDRwN2NwY1BNMGRYdWJUYXB2aG1L?=
 =?utf-8?B?YXI1aHhZZWtSYkxEbDhsV3JnNU1LRGw3YmR1NVlrMW1LUlRoQlhwdzgyUUdD?=
 =?utf-8?B?a2ltOEYxNUVOb0RwRmx3YUJEYURGeUxObVVGZWdCSTRjWHZXRjhvK2d2Nlly?=
 =?utf-8?B?SVk4eVB4Qld2V2xnbURYaExPZjl4N0NLR1FhS0ZkRWl3dE9QMkk0OEwzNFZY?=
 =?utf-8?B?ZXFCVGpHY1NFYXRRTTgxN0w1MCtJZ3lSMTFDVnlqNjVJS3Evb29KY0ZvQWhv?=
 =?utf-8?B?WkNUU3hhV2JQQllLYWVySWZ3WVh1Y0NWbmJNbjloOEdTRUtYNXdZejF1WVVZ?=
 =?utf-8?B?WHlXb1lEczUwK0F4YnJkelpPTlFlRk1VeWVrVzJvTVdLM2NwbkhmQkhlcW53?=
 =?utf-8?B?NC9vTFZuclFsRVY4My8ydWlEOXNiL2JkbTV5aGhTNW1MU0Q4NXZrb3ZiODJj?=
 =?utf-8?B?Nzl0eHQ2NFlyTlRUSFp2dXRweFQwSVBtYzBnNFhsQlB6RGpGcjFldFluWlYx?=
 =?utf-8?B?d05BcnBDbEYwV0JGQWtPOG5DWTZJdmtpUENUTE9GMGdHaUh2TDVVUW1vTG5G?=
 =?utf-8?B?MmdDb3FwdTZxV0Z4OTRHVUM2dFk1MDVOeW9EUlVVbWdHam1MM2RoLzk2dWMx?=
 =?utf-8?B?Q3lGZC9rVEUxQkpPQUFKQzd3SmJrZHRtQjIwVVNTQTZZeFNuUkE4WTFOa2Ji?=
 =?utf-8?B?UndSVzd6YWhRNEUrYkIvTG9LdmVuc1U1WlF2V2xlSGpjbHhCMWJzYy83Nm9G?=
 =?utf-8?B?U3pQbVk5a3hwV2FLQWNwTnJkRnJKbDZ1RzZBeW8rUDQyeGVMcFNuUT09?=
X-Exchange-RoutingPolicyChecked:
	Y8sHv2B5TMmF3qvwkPZ9L/BhgMzJjoqmRSFHXpQI+zV/W8D+1+fnNaK2IwZzO0ip9VmuxlUDxBZEhkmXx/QwlRblGmyksVIXlVM7UedVRQ02qWWzmaCej3ef8Mb1VuWAozMIAFeVexJ7uGAHgl0ka+v/H3VupKLCHRN5UeN+wYz7A4yO+bxBG58rWAnQvr7/VKxa/joqDFqUHRqZKS8ISRH6BLWUcTATbPTZDUovb8A4lvrPYa/naRVci8AGTaAaesS56OKhyLUTktbuN1rCEHL/yEyLFQ0cUkTIPFof2VFjgghWApy6YaGtkAOolF2UAi7m713nx0Wa2tN32OG8EA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bd2c95-97bb-4d28-d532-08df075b1113
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 12:26:22.0943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8K6dQ0MpK8BjtJAt5X4toEVECE9atsgZVsc8nFskx8xYcyYjVPMEenYTb0THTYT6TS7RpHq+LyFgPhKu2LeSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5663
X-Authority-Analysis: v=2.4 cv=Kpt9H2WN c=1 sm=1 tr=0 ts=6a9572f0 cx=c_pps
 a=KTU/bV3Cu5xqMUx6SKv27w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=c92rfblmAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=hK7DYzDeoHX5BbEOzDcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: uvopw91RkNeY9Q-_Ka-7Kroqc54y1I53
X-Proofpoint-ORIG-GUID: uvopw91RkNeY9Q-_Ka-7Kroqc54y1I53
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwNyBTYWx0ZWRfXwFjuuTeOC3oU
 Yiv6HvluZqf0yYHIEqtgSQyV1CbpVPTq/4/sXxc2wQ6ff7ESSwmFoE/KOQQe7vNNO2XMxzpAZmy
 CNZ5zRroKyTwJ4rgNCxiZ1+20dfUt2BddnTuaPfYUoKJ3+/6ZYm8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwNyBTYWx0ZWRfXyPNTtWQRKQ8+
 VE6L/QukgiEbxF9PzzztjagvyYPnITpi7r1Ty+hqO+1LKp56idNMh7hKE2RPqCJZpl7Mq+oHewb
 clzzeEhmiGmchTx45SjTFZzYc/J2WhvOdTzeOlxNIwQB+6KnH56BdbQ3GsaW9aVJpykgG5nHmn3
 aXV22eN1WLp+pbnnSV91vMb+rZOTe2NicPAD6PsWKgpJyZgL1pM4hlsTcZdAP01ET0KwFPdmdmO
 Dm0V7cDhKA6C2q4H6ZxrHY9WpzCDERFnMd8a/9qVhL6CGdR5HxyAsp1Xnz0vKZ6x3nqvMwj2IaL
 DkFbYCEThQ/QQnSZHt56wZ252qs/if/GEJHQh6Wd+Ue/jSRN1wlqsFODu6+xOY4Fpf69vOTRvof
 oHpGm4gdTUi079ylOXIhZSEnmMsPp0sVEara51PIBuEpzxFGsvcqcwY+ZheWiT2TxzvkugptTIK
 3HXJaR+R5EOFxffjJ0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310107

On Mon, Aug 31, 2026 at 12:01:11PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The legacy `src_addr_widths` and `dst_addr_widths` fields in `struct dma_device` are left uninitialized (0), breaking bisection for unconverted dmaengine consumers and directly contradicting the commit message.
> --
> 
> commit e0d3ea2099710250e81c32b95cc62ac180daeb2f
> Author: Nuno Sá <nuno.sa@analog.com>
> 
> dmaengine: dma-axi-dmac: Use bus width capability helpers
> 
> Advertise the source and destination bus widths through the new
> dma_set_{src,dst}_bus_width() helpers instead of open-coding the legacy
> BIT() mask.
> 
> > diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> > index d47ff27e1408f..dc56178cafe08 100644
> > --- a/drivers/dma/dma-axi-dmac.c
> > +++ b/drivers/dma/dma-axi-dmac.c
> [ ... ]
> > @@ -1262,8 +1263,13 @@ static int axi_dmac_probe(struct platform_device *pdev)
> >  	dma_dev->device_terminate_all = axi_dmac_terminate_all;
> >  	dma_dev->device_synchronize = axi_dmac_synchronize;
> >  	dma_dev->dev = &pdev->dev;
> > -	dma_dev->src_addr_widths = BIT(dmac->chan.src_width);
> > -	dma_dev->dst_addr_widths = BIT(dmac->chan.dest_width);
> > +	ret = dma_bus_width_set(dma_dev->src_bus_widths, dmac->chan.src_width);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = dma_bus_width_set(dma_dev->dst_bus_widths, dmac->chan.dest_width);
> > +	if (ret)
> > +		return ret;
> 
> [Severity: Medium]
> Will this break bisection for unconverted dmaengine consumers by leaving the
> legacy src_addr_widths and dst_addr_widths uninitialized?
> 
> The commit message states the intent is "keeping the legacy u32 fields
> populated during the transition."
> 
> However, this patch removes the assignments to dma_dev->src_addr_widths and
> dma_dev->dst_addr_widths and replaces them with dma_bus_width_set(), which only
> populates the new bitmap masks.
> 
> The DMA engine core's fallback logic in dma_get_slave_caps() (which folds the
> new bitmaps into the legacy caps fields) is placed inside an if
> (device->device_caps) block. Because axi-dmac does not implement a
> device_caps() callback, this fallback is never executed.
> 

Oh yeah! sashiko seems to have a point!!

> Consequently, will unconverted legacy consumers (like IIO) querying channel
> capabilities during bisection receive caps->src_addr_widths == 0, causing DMA
> transfer configurations to fail?
> 
> While this regression is fixed later in the patch series (when legacy fields
> are dropped and consumers are fully converted), it seems to cause a bisection
> breakage in the intermediate patches.
> 
> Could the legacy assignments be retained alongside the new helper calls to
> match the commit message's stated intent?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com?part=2
