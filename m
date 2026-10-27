Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793128970;
	b=anO42y96f79dQOwlTAMKEYqZrEI6OD+2Z8pPOO0Uds62L/u2BupEZzJ1YZwDsTBBg+IG
	 dBB4JiYbKnUYfar+za572SzKCNHY5zxQMCFEy45FWfa72EJDsg5nPoDNaFpBYog4YHtGi
	 a6Jlp/Lmef35RgqKDTIfE8gJxthEPjvwGshsTlTJKyuIhIJoell5hlppURO2kSayGHtgt
	 ihGR+7EKGULvW7B848ZWz6mjzbldzB1S17wEdyrbxGcMFnxIRECMSMJalQf257336NhFv
	 0mrxJo8+7x86dk6+ORk5cpWqieGitUptryoIEMAVGUxhvTgVQf9WLXmggNWENCF/ang==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128970;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LJc8ShQtLDcNjiyBXKSylO4t6fnh6xyu/Xjl6pXphK8=;
	b=ubDAo16itghf+BqZnELwDGmFAY/ShVUhPKfd6oisiyBu+Ihenb5VClAr7kIFIq/nUoM9
	 r6OF/vaxn5rzyLAS+ht5zBLYufT3+Z+DWNSx1fTBEYA38yTqoBqHirp+sbq6JvPr6pO/9
	 0KoOYYzg06yNzNxOSn8Og2TvfEw/giqTf4XBnhOXGqO2y3S89/GESEbmDff4a+8+UpNg/
	 F77tJVlU8uBth/oaeKlHlb2vAGz0wooGt2+2U2sruu32SDmwJLbegknTgQFOZT3GGSZXl
	 OgeFQGXwaDD6uRGiVNLdDLjPx0w+Lq+bnH1fUGagmCeNwexx3z15TWxWLoLCFvtdTVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=h4RLcRoQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.61
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013061.outbound.protection.outlook.com [52.101.83.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB06606A31A;
	Tue, 27 Oct 2026 19:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB06606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=h4RLcRoQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djsUHY0j1hvrmP7DBzQgrRhBZiY2+O3JnDSgMgRkS4BQeha+7VD7gde1KkIWMKQI6AVr8w74eTnsX/8Yi/jrU85T8N+TnR+EQWNJn9XJQycsYqkBlGr9bZ1O02a2cR6eZTo4XI0KFdOIM+HoE+Uhm2X++Jjd83K5405YadO21wVlXSFP/fRB/LPJ1I2TPlG31OZZSI12vMdJGiLFN9H2s0Elq0I62BbSOz1wx65ZJFq5Iv8OroJpBPm6IYo+emPpdjKT1NY3yGrs5cV4W+rPZ2FeZ8WX78jI6EKLBsclWudUH7p3pZ+6TvqRu49cEWqSKQ41NjzWlzE6yd9NM7Jqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJc8ShQtLDcNjiyBXKSylO4t6fnh6xyu/Xjl6pXphK8=;
 b=ZLtGatvKWV75xJmjSBROZpehuhxFFA1jdlVU7tznULK45Qe11Ypjnv6kE2OKEwrw5Amr1wT/P+9+28ii1ROyZfEOUUTG+UGCpE4ML4Qy1+o+Inl1wguCbhPWOgF8LXeEIl4FFCEyiIpT//uGcvGjHHKJrwZQwZs1f8mBi36v0j77v4LwUeQrXRYO8qneAkVU5RLTfkjLPu4acrCNRgO2zPtXxxvmbaI+IAFEbdTHCfC1vuvLfzlg5mly6aWCZ6T37FLhnP9WtuTO4RM96peuNegWE06/NxFP46IV3KRPw3VA81/qGw+KESOe8D0rkqEomunbuDLD3pdKwhgjt/odVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJc8ShQtLDcNjiyBXKSylO4t6fnh6xyu/Xjl6pXphK8=;
 b=h4RLcRoQvaSSaKW1/eUpdU7DSD2K/DoXBnCAZGzY28wmqf3OVabm1ZoMSi1KHINobET5aHAUgkrXOOnfH+wLVkZJ7T0rqkpHXSk2uxJus5CJRy/DQ/rrwdRRJ+Tgwvx0TWoxNKfatYj0yaNdQfaA0MTURocX3cb/5wksB0n5aHycpAqm1c4jIztGTf8bI8Yrxzv7+TgXBbDAOGOfgVpPx8pWwD2e0gIJQRazPwOvaZnsddRQ8bXwJmyhZpGqoY3voWgH0fDvULEBmACzozC3G6ljNJEsPblsElPY7BO0sF83RzqXeI5dk+26iZAu4ALyA7JX4huZd4H6G8AoCQxRrQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB11545.eurprd04.prod.outlook.com (2603:10a6:800:2fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:22:46 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:22:46 +0000
Date: Tue, 27 Oct 2026 15:22:37 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Jeff C. Jensen" <kernel@nullptr.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Alex Bereza <alex@bereza.email>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dmaengine: xilinx_dma: Withhold an AXI DMA engine
 whose reset did not complete
Message-ID: <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-4-20faea2e7a80@nullptr.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-xilinx-dma-work-v1-4-20faea2e7a80@nullptr.com>
X-ClientProxiedBy: PH7P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB11545:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf5ad14-ed95-4e17-0127-08df345fae41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|366016|376014|1800799024|23010399003|261026121527099003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fUw38npTVsLKEnCDBWV3t0i5Pktw9YvlqGO0kmF2Pibvlzmhe98wvpllZhIqwrEkEOTRw0LKTxoWpo8LDzo6r7DgoktR4wlkWgSZRjHu3XpuiW5gyE3XWTXHkoObAcwAJ3lJbUwFqBqXogfyKhex1cwNpav2rEdruIGRWaZO9T+TPlDE79SyV8T75scIQ4CDXgDWelmRiPii/94DTDRzicfB60a9D5vxvOhFKAvC1MgVVaB1QAk1bRjBWUOPJxuTx7iVDrwHEcFc4G06ZdxPKnPQjCS7rj5jyejS/kllaqBRrmFOWeUNkrXoCxNzuzMpd8z3d9KwGUoIzzQDKKfy077vxMasq9lNMR9TbP3k8lpJVdESXrprumb1A6rpPKGnfGLzyknZrUU+AVeaBQgmRbkdq9RqIXlMFBC7zI9Jgk7huIZzc1OG5tePgkNUQ7+kpiy55mbBWxClQrFlwEpMdQDT1bHPSrXLRADWiJoLnn9vtbK4kx88vIhcpMkhCC4iINc7Nu9LQ4a5I12wngIKme0M9ii/RwWTarjqyxRFgqZd853DKe+7s8zfyFqj2TFCuGzD8iH0WYMNQjypTH6kO82Fhr1FBC7twH10e4+UZHNxSj1j9k6cliyqYqBoqAOB9lXmJULLCF/4diZXItjxULdhRZKtGNKfkwIeHUJmv1Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(366016)(376014)(1800799024)(23010399003)(261026121527099003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+VHxKIKJoNBmCXDsAzkyjX2bkvqPOHyiNzIvpbPvL0TBUDuFoDCE82ANBRpg?=
 =?us-ascii?Q?bsCsmMU9+h/pdTGHQDumX9GX6P+pmzLIO+koYDlbKa1EOSDAHdFxB0aPyb78?=
 =?us-ascii?Q?caplaUOiKJLXPTIuE+0qKkesWQnsQxkUU+bl/utC/SSrUyxczkTF4atQ1Gx8?=
 =?us-ascii?Q?MKi1qLhT+VcoyUqYq8FC4Dw79z1O4OGQ8/KdtBGZvn9z8DwgX2TLJ67a9Hzy?=
 =?us-ascii?Q?HbxgZMU7LAUTlzhvflQ7kTgzti4W8blBqgAN0+27UGcuRRoGjuwS7Z7xdkWz?=
 =?us-ascii?Q?RV2G+Q6qdk1JquYVfiN5UrvnVfkcvoAPI9cId9U06ULRstJp9L34Cvz3hAuM?=
 =?us-ascii?Q?j/NAtPc5zZUvyOsXuAPSkxgGdqttf0r70/3N6S2HRbcki7LSTRlGJStFpQpw?=
 =?us-ascii?Q?Iy5n6orYlVnQ+SCKV/pZaZ10a2xDmPwlFOa+nl84Wc9VJJ+5TT8Vn+d7ajgB?=
 =?us-ascii?Q?XY+uZxR3KIo9paDK5/0wgS/iKhzfPcfu7V7/mqI+pks7lFQNScWrdAj3rLPT?=
 =?us-ascii?Q?OlSinrYdbwjJyl31ecYPAoySoxWc0Z1felM55IqtyWoj1wxXx7lAUAPLpOgc?=
 =?us-ascii?Q?I7qqPsB7eqVaChNp3Pj3YEJb+DTvUnlAf3+0CvlNsXmfiGXWSchvW4lumcb3?=
 =?us-ascii?Q?60BvvyPFQUA5rfrPdOSMdiaLUlUZitADxa2nvSsU6H7ndd3y+eqm0HO8N9vV?=
 =?us-ascii?Q?dm2fXcY9n8iTKTnOcFkUpXAghCdbT/HPg8xKPTHG/zZ0SPYZtvkG3Ln5Nlm9?=
 =?us-ascii?Q?KazNa3g4ryCn62BysgH229/K6qiVONcFKW46D0OQOM3WG1SCWiTpysbYtLbe?=
 =?us-ascii?Q?jIbuQRUvCFoaDUItWJuRSMtQDEDmMkyzZ8dCoLGnxOZC7mRdfa3l+BCs70iE?=
 =?us-ascii?Q?WAslUcR3NB3w6OaMEVppnZtDZNKvT5TMU7i7Viu5rEgGpYD1+njDMOMtx5x3?=
 =?us-ascii?Q?dM5DDVa/XXu5L1L1zY2CHNIMfFbwD6y2pDjMam4otZH/SoUtQyY9SlWk1pmm?=
 =?us-ascii?Q?T3XBFp1aEQJiJ30oPiZ9ZCQruLxZzGX6VelRjiDP3qm9jX/hXBdsNRS/olRy?=
 =?us-ascii?Q?u6yqPRhyaLKl4u5hB7cDv1t9cHgIx3+prOuto877UHgi4XZ3lkFiNo6+BLGf?=
 =?us-ascii?Q?q/iNI2c9RJwOkMrawU+0YPKD+yGrUoZb6RSiJJMSI3zrtumiDKE/UZHBriDS?=
 =?us-ascii?Q?9xvYK91PGjxrsDZdsgh4SIo9e+2RBLcdLoLoYTM4YbeQcYBsrsl/va7RjuAq?=
 =?us-ascii?Q?8owrC2Co7lUpvyExDmvG1sF1j7wBMFQBsPDYMEzqzGKWcgc6TjpIAJArKfxH?=
 =?us-ascii?Q?04yEs1A+jmjBqoLm4bEtczkidFAgRJx1d4XS6rGrNrPjkohjNSFHvjUvdWqs?=
 =?us-ascii?Q?L/nkV0Nwf/LJtPgb5dwvYXBK6KnS6VkG32oSV1H7v7u9626v03QEaab59kXu?=
 =?us-ascii?Q?ZB3IQkZkyikf0tf8w3SMPA1RGE5Rx9Q4iAu3I6qxKlpK20Grqdesuv3bWiCc?=
 =?us-ascii?Q?cQdHYigi4HqpG0qbwhaP4jwrYM8IILKE5+IJTWHO5PVs7590GhvisR3ky7Hp?=
 =?us-ascii?Q?ddbevp1emDZ1XeGie1M81ugg4GeVhzOd2/8cxzdh+IV8h5pOAwtlUPe/jpSj?=
 =?us-ascii?Q?8gwUQZN7IcqkBDig49pfO9mAfPdx3RKqKiGV4Ew77AizjKcRUMzGIB3NzBTd?=
 =?us-ascii?Q?91KS3SnJ+YHeBN03gJY+McABHI5YAOf9Kb1tmmdkMShMSSmMFwqxKp5E9CxV?=
 =?us-ascii?Q?4suUGuiiKyUScCPneA0QywCsiGgVmNBBJEyMrxjP4QnNaBzUVfYV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf5ad14-ed95-4e17-0127-08df345fae41
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:22:46.0903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjTmalMYZB41aDtjBz4hyLg5aK3+iP2equGaeCqBgD7sRViK7Ph5HWHXwa83JfIhmtiZ3HCyNsaTLvn2mTIjaBDRw0+orpdqIxCquQaxil7ttQUmUSzMekG3afAe6pjd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11545

On Thu, Oct 22, 2026 at 03:11:33PM -0700, Jeff C. Jensen wrote:
> When xilinx_dma_chan_reset() times out, all the driver knows is that it

Does this real happen? or just in theory

Frank

