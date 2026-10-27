Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793111977;
	b=YnqlVbULcwxq6XxuEpPhuuYbmWI9jelNmbvsgqNN0RO2PYcs4WjnRFT1xfgTXKpUj4Qn
	 x/iVR1u0I0eQXL+tY1QH2kfGPz+LabQBGlMG6cPohooxjmIui+tkQEMT1qDzF5BMW3Xwu
	 iQtT5RO9KUfSsJuxciWc2ZOdfbIjUAoyLeS2JDxzPFiHEH3A2IeNFTl4SSDdVlmYQGHvx
	 LhEzsyAjmDF38nqZp1N3f9uwryXzTnxgInIXa9ncEmHyRmtmLJvRX6844rCcWQgzFICEy
	 oF5muDa16VDO8vjmxwgO67XQ3RXkEQpl3g6vNfLtaVzuYIEepSRl2bzpLJYuRgfiPSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111977;
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
	bh=Ge43CLnuUc9WaRvsHsCh4k2owGi3E/Zvf9CbQB4TIbg=;
	b=hxOL3NsDN2yAcllmWtmnRN3XbA4Uol35WHBXN+UHlz0dFevX83Itz9mnkcehrmZbSm8i
	 li5lYao1pXvpj3qvJFZYEvJsxYe+Pgd2dg5zKm/q19T6njTKNyQk039xzXuE9c/FkMt+Y
	 fhiVdyvwWBPlV5KGaIvB5Jh3+tzrdvJbuhM8CROWtgya6vAe+x85uQrdKGq8/oWnwzqAN
	 e+6dLTQbuPv453mSelIV0NOeQzDvT5zyplIqF/xRs9HRRgpwqQOSgcGD42yj0y/uz6zgx
	 07lIz1W8m3p+XEgZKGjVnl9C0YKDtOh+HOO7Ml+9vKhh+JEDGeIsAnh6e29Ky6TIRuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=MEd821nI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.23
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A9B606A320;
	Tue, 27 Oct 2026 14:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A9B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=MEd821nI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfmHXDn17J+ocbDC7KNO4ak7eWv7K6rlTZ8D8KJ5iTWZz2n3tRWsfvaBtg+4e9kBq/S6Ohu9uGbKIceu4eSWeSHQKwWNczEWKCOaOh6ZLODY4iErw3Ko7etnSjvkA8gKdqKKV7rcmuV/Wd1He2Luow4/s3lfhQiXrcOIzlwqI55OtHz5yG/PhY9xFTsV9kU84uKBVRNOFdnbI7rQdNHV0ERE+bSp0TeFf3LC4ByXxBJXKWoEVmIQcjbGxt7tRu33/ehudSNgTC2wLWCAC3jZdSt7K07DsiFAuBxb8wKuSHWlpmcqq8ZifMuwkJtAPDctUg7/kMtXZqlEh21JB8b5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge43CLnuUc9WaRvsHsCh4k2owGi3E/Zvf9CbQB4TIbg=;
 b=aPHcQvRilV8iQP1u/cUpyu69HtxQf5QckIeQcIGAh5JLidqTRYAjVnjxroBXjiYMGqmUAlrCj7Mvyf5xNI+rMXd3ZUo+t526F4hSdDBa+h+gG0fcSEYS+yV29z/w+F7l6tpY9b6gVj2Hv7FlLdU5x1aCsAFxl0dtL99gxGf7zFfd76B1CqZ3wRkdeac23CA3Of2ri4SDoiKW17DiqYIal5SxgkKPT1Sq+7BDAPQUVadQKbukmpwPj1KniZy9/f1DPMGr0a8mfHbaNsQZH8Zojs11BvbFgyEpXoo1gtPWDKgllCZK9Qtb/bmAb+aThlqBdxn+3ClwC7TNbSt1DvnkpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge43CLnuUc9WaRvsHsCh4k2owGi3E/Zvf9CbQB4TIbg=;
 b=MEd821nIbuLVLJzwe2mmgKsfvaC+8zte/mmTBBSmJp4rgwb5bGfRQ+OCTbiJzVstBML2pEak76CmwD/NSMW9hwGRLfuov91rKnO6sL5dr0uRLEVRyOHRFbSw+zBaSICu+0YSGtDPEh9CmHkSJadVrLyaP2hIeQ+xKtoFUTUwU62FbR0gVwhD2ZvRtr6EVV6WU6FwvMAdi5zeCgAoZqfIyYPa+58VjQDfX5XLabBoscYcG/AWodf6k0iOfaNMPjHmVGAwDOQT50/JmFPL77GLU4OB/+FdjspELhc78u2QeRnZelPgdxQ13bskMU+Vpj5ykrLJ+6NUE7XH4hga3HjeZA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR02MB8248.eurprd04.prod.outlook.com (2603:10a6:102:247::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:39:32 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:39:32 +0000
Date: Tue, 27 Oct 2026 09:39:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: pl08x: mark slave channels as DMA_PRIVATE
Message-ID: <auC3nGX0hA494DZL@SMW015318>
References: <20261027070037.1809112-1-andi.platschek@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027070037.1809112-1-andi.platschek@gmail.com>
X-ClientProxiedBy: PH8PR22CA0012.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::8) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR02MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c8d39f-a567-4e91-5733-08df34381cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|18002099003|261026135527099003|22082099003|261026140227099003|261026130827099003|56012099006|11063799006|261022105027099003|261021123027099003|261021121427099003|10067099003|261009223027099003|261021133027099003|261022115727099003|261021130227099003|261022075727099003|261021135927099003|261022113327099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	fvKwlpPeI7ubNQLb4eh6foMQE3Nb4IXWFRgsfVaucHZV9Oqq31YSqbTpzG0s2wvvnVY+4xcJtdCoKk8FGYcVQgTkteOp3Go3KySIsD8hlJVvJNZNNoC69DbomFBscTPngDbQyjBW/MZg9QIwfXeNgMLBsxwL8Aq8zaPrUGnEqVpBjf4MCfAtkxq0/7bSnyOgOxK9n2oVazEkf8N2hRq4xiduQp+JU7+aBtaMBSTy5lCj5gIb1QdGdlFGF/sxE9usPvDgwfZPYHFfoLJlgLH9fXyrqqO3Hyti99UbCFWA5TaWskD2l3LWftfW4WP2Y5xB2vkOBd/rD7yc9QlnTZfxLHjcCfmNvwxfet4RVPgX2Y9P35E8APJwRCBuQ7aCTfonLxnZsxY1FVclI4I9h+RN0SWBR8HyvOc5tJL2l9kEWIAb66QZzoh3BLt/QhttRcoJX4PnGYY57BXbuS4HMxBixOpItQbc4PiC+1rRTUEvgA/qElsjNKOCnh1J7zi1hcTmrH4N9ldwPYazReCQqDZRXdbLJGhcLauln8BaJQbGyzO5ktMDjKXi7C1oiQ80Zx4AWp2QiQtnaQ49lkGlQmLPfGgLLoIIafxymfVbjM2EO2TmAVPeQMKTQha3s4X4xONTIACtsV2no24zZOPXoD9hjP6kO/1uUzpumsFtSYoSPcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(18002099003)(261026135527099003)(22082099003)(261026140227099003)(261026130827099003)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003)(261009223027099003)(261021133027099003)(261022115727099003)(261021130227099003)(261022075727099003)(261021135927099003)(261022113327099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ntKbmLDDl3ve+g0C84dGyw9m5dgiUgb2ami/zJ3JebnBbdVUQuL6JTT9H7u6?=
 =?us-ascii?Q?cRrVAXB/XxDx+dYkF4J3l6KtDmkImoal60BJ/kqRXQmUgYqzmup4aKvuZCcp?=
 =?us-ascii?Q?iYRKsYBBn4lPU9UxE9p8YonVJRT7ercTwPc3kUsLLn2mfKNzYXncYAap00Tp?=
 =?us-ascii?Q?HdlGC8ODuWZATZ3wsxj+U0vtfs8L+I4BpHAI7RgRhZXc8xOfH+Y3/bIO6q2n?=
 =?us-ascii?Q?hBHGoPYwzIJZXmrQII0Zm09198Iz3fUCD6IRfCX7AaBO0ysdLIg4MtmO0VP1?=
 =?us-ascii?Q?46JoXKNAWKYMboa+xUq5DxwMr1JMXwkNVCp54K6hEuHQblHwLXjaIIJKO35I?=
 =?us-ascii?Q?gySWFGb1N3QkQjmLt+B771B9KgPokwuWGpyCIAapnOVOXfb0L6M8X0FT8e4U?=
 =?us-ascii?Q?MD4DqTGEJ5U4yenkoS7xqqyKRUZs0iS+a/V0pKxzM12vxcTLVHtL2sbSXNV+?=
 =?us-ascii?Q?1nlcdfrglm69sK+HE/pthptc0+SVBh1m+vN05ocUVn1GOxpWZNXo6N22PsRj?=
 =?us-ascii?Q?LfepTu1299VNNIfcgvtcM+6kjsGtK3v8iDspyk2OHHzNN7cYfH5chaJJomFS?=
 =?us-ascii?Q?VKfnNHOVPIWlkA18N0c9Y+mRjAhOcgvlI3GPZqo//9zlLtUIL8FUaAQ8OOgy?=
 =?us-ascii?Q?+QUlQCYFN5aca2Xv0e3TbesGaj4pPPiBojxNglf8fDoihi7bxD/IaYo93Q+0?=
 =?us-ascii?Q?ZqSgakfpHleBbV2LP7ab7xdS5K16a2Af9FPq8jsGxXMIB0kN1x4YEi20wAkY?=
 =?us-ascii?Q?jbRkKTD4+8fxeFmzGwGyKxW+iiP9tJ902LMqE/QF5pQ4N7bmFZbSzU7qr2Et?=
 =?us-ascii?Q?vSE5w0a2qX3zQPgS2cjLCE9humLS5L1iCowB2r/JW+MZK+fF5S+06Co9oSCl?=
 =?us-ascii?Q?PSWSdE1zOsGkqPslpbvMSlRTCNhu+P6cnFNpWegO4GvfBYPKN/u1AVQCKp1e?=
 =?us-ascii?Q?DMWSlbRcjaD2O8ejZ6QvZQlTxhlQyqiinPx3kJWiyk+75vrN5e2Yqj12JBWK?=
 =?us-ascii?Q?C2dbJhLO8PwHYzJIL3HfLEa/vruvKgolg/+l8KPvF6rFRKl9XULFsnSSMeW0?=
 =?us-ascii?Q?EODVxH11RFyKwGJVoT9ykxMumrg2ZU2ZUuV+XqgtHaKFyVM2noxA1pkrCO+F?=
 =?us-ascii?Q?HFlGz/2K2SZXFPDQDXtRVDqRRgM/tm6MVQ3LVE4/3QTnJPgGjTYPRrVdocnw?=
 =?us-ascii?Q?YZ0i6xVxL09QiSLabk8P6puXQNy5A0c4mTUV2w5ll+n/wnkfLA/LrkUimxa5?=
 =?us-ascii?Q?D5O3f6QGamrd0s//HV9eirTGnGmduF7PpN1P/tUXSUI5DF7vLQ5K5KAJhR7T?=
 =?us-ascii?Q?kedHtpGk7oIuJlJ1akSERPIck5jAVG/ZafoMQuXl9nuKfS3AL+sw/PbSq14v?=
 =?us-ascii?Q?aDVvmRQjCaEMB1vTogEdyZVNemy1BlJ4OQm/8/eceK+SaEH/uO3MzE95sN5y?=
 =?us-ascii?Q?Ol/3ifj4zyVx97LRxF57XOT4YueYFW+ZHMGZqsrPYYwCAedywh9uA1iNnCD4?=
 =?us-ascii?Q?qFtbnV5myAkrLWiVs8g5c4BBOv4xDrfLbfWfaGbGz8T3R7yTBbLkcqyk4vui?=
 =?us-ascii?Q?KwGOiRFJxI+s4kM+PJHU9So/Qg4HXYXbnVR6tq3ixpj4FwxL+2hmQphEwusK?=
 =?us-ascii?Q?Zk72lYKlmrAct7eaup2d7w0g76cwvYTJ1NFYTXkhXym3FNaa0snMM/is/66U?=
 =?us-ascii?Q?mbvbmYcetwOQUvnyz+8YNT/4iD5r5ltvoclLQOjnNi1NvdNMtnoMQ7CMx0Ap?=
 =?us-ascii?Q?Xp7Nve7ZmEblgjNAoXd3YRIepvQT6bmmBTfjHgxsQ2AJ7UFDuxFZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c8d39f-a567-4e91-5733-08df34381cf5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:39:32.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixELEnHWwGI9U6vUraEa9e9zvs8Iwi916MAO8lvr7U2v6fJ3odTVR7jJiNqYBOjcG8VM5O+vWgjK5Wy3Pxei6QaeCLEN/OPvErkgoLfpoQE9UOwvz84n+scIJbMraRh6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8248

On Tue, Oct 27, 2026 at 08:00:37AM +0100, Andreas Gabriel-Platschek wrote:
> [You don't often get email from andi.platschek@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The pl08x slave engine channels are only ever handed out through
> explicit requests: DT clients go via pl08x_of_xlate() and the
> platform-data path uses dma_request_channel() with a filter, both of
> which end up in dma_get_slave_channel(). They are not meant to be
> published in the general-purpose channel table.
>
> Mark the slave device with DMA_PRIVATE at probe time so the dmaengine
> core treats it as always-private. Without this, if a dmaengine client
> is already active when the device is registered,
> dma_async_device_register() takes a reference on every channel,

Code change is okay. Are you sure the above description correct? where
code set it active when dma_async_device_register().

Frank

> and
> the subsequent dma_get_slave_channel() from pl08x_of_xlate() fails
> because the channel is no longer free (client_count != 0), leaving DT
> slave clients unable to acquire channels.
>
> The memcpy engine stays public as it is intended to be shared through
> the per-CPU channel table.
>
> Signed-off-by: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
> ---
>  drivers/dma/amba-pl08x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> index 543c2eb8cfa8..06881d3f29a9 100644
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
> @@ -2775,6 +2775,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
>                 pl08x->has_slave = true;
>                 dma_cap_set(DMA_SLAVE, pl08x->slave.cap_mask);
>                 dma_cap_set(DMA_CYCLIC, pl08x->slave.cap_mask);
> +               dma_cap_set(DMA_PRIVATE, pl08x->slave.cap_mask);
>                 pl08x->slave.dev = &adev->dev;
>                 pl08x->slave.device_free_chan_resources =
>                         pl08x_free_chan_resources;
> --
> 2.47.3
>
