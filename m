Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792785919;
	b=qL/nAVGJsQKCLQxC55r5f9wW51WqCBtmP6a1u81zGNRcLDbi3/p478v60SGsO1ifwuA0
	 per80ONSQnjibrEdHhr7H9gu1m7gYWQCgsStBa5bwfwDBOoOvHVEj5QWO7fxNdzaYDjgp
	 JcYSqZWnQYXCpI9MToqbDiExRZ3jWyZQvvauDGRSmXmyx5lekOJIyAMriraqzsM+6lfUt
	 pIQD5wYreS+Z399l9OcNe1Fx1EdLCGnYpi5udPP7HRenXfoGqLo61YoAoXhj0Crtl0q8o
	 Lxl69ea/HosSuYatb165wTKyDpmCL6RVU54fhHTGQLkkEIIa4r1YlaV61SW/u+NcZPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785919;
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
	bh=/NTULHJHfUfSCv+Ar7jXUNGHcJJIDzWX5E99Hx5lt3Y=;
	b=VppTXv266x0c6Qe6AkPUsi6JBtVkLdPdcSmG//GxUcGK2FKEIxKU26Sl+oOfdls3eOHC
	 b7E6uLFGGGg5Vkzu27jzZ8rvAfwqc50brmkzNzSfheAcAKhND+J4Ai3B68rFuMdaGgr6i
	 brKCaPiEMXq6rN/emVXeDqqpH9eMjNRMsv5nEdcF1Hogq1bRtKMrF2ZmnFlSFLCdBJrk0
	 9P1+1Ajcwih1v1a3oYnHOQz94qR9vyk2hOujU6wg6uZsT+Be3zUcUryheL8epmU+Ugj5Z
	 mh7KgIzVGAl1/hpqy2zSCxhWMbVRXYhXZtpceS8rUeCoqb2c1xpE5ufnCDUgPUMBHsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vjZRMYMz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.29
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2EE606A328;
	Fri, 23 Oct 2026 20:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2EE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vjZRMYMz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2Ef25bp1G9x1Ypu31DAvW38/rODe7qgxOl3I/AboOqo26hMpzQDaKTIh7zhCxjO4A5Q3rvj/iIpMTCaJJGbpR8VRtGz3yIk8zHn/fl5qI65e+Yj7TOVZkQpx7BYw7sqfz5Any7eP7Jf99BUh3/i61sZDLvlnFDquAEMcvz6QhSyKhPx+/0WxQxpswAHRqXZeCnkgXgmRj+MdDPKuvdLEJuJMahsAWvcJd/I7MhOb7s9oQL1BorN8RI/aBwRmh9yrCWQ9P5Uti/yL60SJxOY19JUcxtLiFNkLEO8ml0xOpHvGSVxtJOC4/tVaPJnmMbEmm+MOIdTAtNYJN631DotDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NTULHJHfUfSCv+Ar7jXUNGHcJJIDzWX5E99Hx5lt3Y=;
 b=QhBNIzUAtWAHRGTZ/0aBkVPgMob3BIBllQmDllou68X7qpp+lRRrRpmJlJ5U5XJUZIcSWaSDh7Sjm3R98IbDKQZCLDQ8EohXFSPQr1KPudak4+z4ShWbTj0OWf7yaQN7/ClW8+Dbc/N7z5cgUBZbnoJje+8Vwo8aKP/Cxqiv7iRoGhD3n00Pus43F+dAoEXN1f3eIMmRD5P9/I2gdxxLiidB3c46RsOgiM+uWSGB1Pds9zSPGXb0wfchk4ssuHeJetfCAfFvs4Y62kKwUn3HQQo9+J8UMVjD9i4azrCuSygP0sizyoDqHTBbBVjVYSE0MOAHDU14iEcL+yOf4Q7OTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NTULHJHfUfSCv+Ar7jXUNGHcJJIDzWX5E99Hx5lt3Y=;
 b=vjZRMYMz8Qkn66hDhXGuNd0bHijj9lzTE0ZZg3xmVkASisbfdNMs0QCdgIFAtr/H904s2APfP2eYezNXBkrAowoZ6zeg/BejNg9xawCr6Bwr3tISz6F52XTI5o5clym6qBgqse4B0BVXTDaO3LZ8azxcmtUljw24lU0cGB9DMIobyKpxhgZMBHjbYd905abU02rGwq4he35qhrHWDrnXK9XPqgwNYigBt3plB8WFJbOVwj/GG5t5iUF9aXxRG964IFiwjEZuKJ7qwMH8yrMV/UtF/OfE7x52NP0EE5YW/oUhkcQSp/UjQ6aoyfVafahRAuQHosCc6FQ2CpUMDkVPzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB11546.eurprd04.prod.outlook.com (2603:10a6:800:301::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 20:05:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 20:05:14 +0000
Date: Fri, 23 Oct 2026 15:05:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/6] dmaengine: sun6i: handle the last partial
 interrupt bank
Message-ID: <atu97zfpnCHWPsMh@SMW015318>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v2-2-c9e07cc44bf8@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-2-c9e07cc44bf8@gmail.com>
X-ClientProxiedBy: DM6PR02CA0139.namprd02.prod.outlook.com
 (2603:10b6:5:332::6) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB11546:EE_
X-MS-Office365-Filtering-Correlation-Id: 53bc4e90-5fd8-49cf-fa2e-08df3140f36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|366016|23010399003|376014|1800799024|18002099003|22082099003|261022105027099003|11063799006|4143699003|261021123027099003|10067099003|261021121427099003|260925021911599003|260925021311599003|56012099006|260925022911599003|41080700001;
X-Microsoft-Antispam-Message-Info:
	6beKvUW1JcxYaaACZRCxVWr41DlN50eXT+UVoCSqMiI2CmVUo+NPjxWDvQKyaVbwuAMe4FvLu25D61G/k3olCUA7xCgeje3YbAuCLX6YcjcZvZJaOJLFKVoASK74V+Ja2A/5++dB0eFr6CdAnAgavXNNq7BkQvc7UX/zKDFeZy3fDII7eHTh80K8b7j4JRDQE2/MO1oAGEiz7FVTgvC9+POIXjPL73QM55xNzAeCSXu3hB9oRk88elKpoH6LJPHF3GTV6EiPJDbrvBaGKiSx7VuE1wzgDJGG1lSF8EcUoWQrXUDkKKFOd4hwY/CVINc8tEwcDDSt8BQc9nuZvGbwgDM82HHuNDvcx9E/DXk+zg+vbjzpxA7jolPogpNNQR5BvmlGNgwS+uWp60KebI7x03jGgaYu8/hdaIQxf+dhGf//D9CD8NNmODfzUFJTpTrUYRrfBJ9If9xlJAwJNpuGrNrv7Hn94G/19qpDODhgcAx1oZJYNX5TnCdhUUV/Ukp4e6N8fb5HUa13Fl9n/FK4C7oSsDmE5bw65CDYRbXfhlJIXXkbc/XzsboKnNAbD8YIJ6kezlJcKmqbW914SqnoKviMDb+KD8fdZDmdCUknEZds06JSswGAPb9WuKO1Hh9+FyzJxgAuv8Y+06EXAFhVz14U69kddimp8e8+lVRPmSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(261022105027099003)(11063799006)(4143699003)(261021123027099003)(10067099003)(261021121427099003)(260925021911599003)(260925021311599003)(56012099006)(260925022911599003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xwgROJad1Ae7mCUmJPch4xpquoRztvzOgPNHVO1Bg7GCDwc7gmI+AUUAWvUb?=
 =?us-ascii?Q?ZsqzUEg8JsIM0GR/PMtBmS1vHJFd8Iio05rSAk6/pH773OK1uX211594bVPq?=
 =?us-ascii?Q?Y1TJBKbj71dEUxxYYAHq9cjHJW5oynL7KU9qdjPUbULPM/lXguW5686uV4c8?=
 =?us-ascii?Q?CUSt92iOrEGw+SyjhWTUWmZ2dpS6RSHvAr9hjdSUCt2SfNu3EitZHzGJMZsZ?=
 =?us-ascii?Q?aHNaEBznjcbpnMq0oVvsWYomNeqN+Z0Ifxj4brPsbkfEkwHxxnvNoN59AMAe?=
 =?us-ascii?Q?jt+K1pIZzXpXVVf057IImTNxvIuMZRDV17GG/tNz2emSwb5Dgw+HgZQGNXr+?=
 =?us-ascii?Q?/IYy74GZgIjegE0DOjTFdiAvcpSX9buK2erMUXnToUzxImL58qhDLJVHRZax?=
 =?us-ascii?Q?q8ujgZcizskpaavw+4+qBkVwgbw9ahTpn00ffMotXZ7BHf0mCEfRfYcXh1MG?=
 =?us-ascii?Q?cljXi0SiToK+AeeL1K8MPCJRuuqXmiz+OoXKvf24CBNdEQxK/66vv634d2cw?=
 =?us-ascii?Q?mloFEWgnJxSyAA/Nb38xPLy5DxyidnYSZZPv63OHgQlqm7Rl4F7+vtQ11ciD?=
 =?us-ascii?Q?51osf7ksF3ws27FdXaFxMd2g0TN6wqj/99mDTdqwzKOaDpk19pVKEXZD4TM5?=
 =?us-ascii?Q?N9aiRLQm44AvtWur5xB2H6hLwpC7+iX779tAocyFrOZbXzCPTBUaL/dzcRJs?=
 =?us-ascii?Q?JLfPvZ0ZKeZHogz4o47jiSuGps8FbZfkouJcdJk+zFAZAT3Zvbvd49I+cH83?=
 =?us-ascii?Q?EhWzvZFbH4tNXADtdzs4vrqhRujshAe3762jEhVM/57tvbPV8ddiiZM+9VOu?=
 =?us-ascii?Q?afS1z+gAOe1J0kztkfV1/B/Kl1lZZ9RESMEQIVvYashpANwQ2byK32+iF9Lw?=
 =?us-ascii?Q?tShvG2p9HrsZ2I5mkhMDWz4EyxoxQqN933/NB1iNfd8PW2E3o1sWM63NP/gY?=
 =?us-ascii?Q?BlXx7Dxj5f6XqkkGCu+fAdsZK+NriiCtG1YoLKXKbe4iLUV50O/tE3VazACS?=
 =?us-ascii?Q?ryDHYeEB7N7DBdRXzGCRWLqbuhi/xq94ZUFu7760pWgUzptG0OsyV1emJkYt?=
 =?us-ascii?Q?oa5KCY8HTR2DMDHGnM7vMK03JJ88nCk20s/Q4B9EmapkWqsNu9+m0INH5HUF?=
 =?us-ascii?Q?hA4VvjXbQj+YBwmN5uaR2PFbG8diJy3sV7/J4bzHbeIJAkjssDaltXOb7Toa?=
 =?us-ascii?Q?W5F668Wy4a2ne89GpkPny0RA3W2yxG+wyr+KfhYsXh+7eY+la9wPyvgD85kk?=
 =?us-ascii?Q?IX/QyEPEgpJalh/SWW1I/vyORvl9Ej9S/UjZg1R4kKfXCR/VN91MwzFzk3pF?=
 =?us-ascii?Q?ByaQPYQCXVLOeT4D0ilHyowBYMLYtI1qGEkQcliJadh9xQSgVSJMzo/AadPH?=
 =?us-ascii?Q?+LO7z2/lhwyRsHDgoBafj+D3emtQRN1FEV0V2nVs7/1kibhFMRQMw6gdtmCb?=
 =?us-ascii?Q?KqAMPbzXERIdy7gvvKYA0RB/m5rzhlSZ9Et3bQ2q70FWIxdIz+ZHWs9PGGXu?=
 =?us-ascii?Q?IiyOs8MqZc8YKrGJpllboxZQt3M3gRY1FgcqmQYS/b01X4vqZTE+x3rMZcho?=
 =?us-ascii?Q?FDAd3P4N3HKoDWGEh+kYwcJZLP3kuuK93ypNSi6jP+wBoEoG0V/jpJbQaTJB?=
 =?us-ascii?Q?Zrx9iqJdgWPNnMR+iUbn+lq4s19yHdLKpLhnUI8Y7H1br1nhWZAckw7Ic59z?=
 =?us-ascii?Q?EOV354xjqd06Y9grfWnHVszFjkhOitjDnmd70jcjXmJ2/VSeIEhU4GzzEN39?=
 =?us-ascii?Q?38iPVQc8ARMF9EVSytbiMG6uzeQjxb+eytTuOj29pSxSldfZqR6q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bc4e90-5fd8-49cf-fa2e-08df3140f36e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 20:05:14.3904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GP5S2ewxv3D+EjIxW4sd6bii8kBZ4IWpimLRa3MAEudMrxpKDqOQ6AeJzlNtevz+lG2uXRHeITo2wkhpqEUb66gEMu73NzXAGzbNI7gTM0xXZycS1SaF0uS3/9TKqKTP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11546

On Fri, Oct 23, 2026 at 12:42:36PM -0600, James Hilliard wrote:
> The number of physical channels need not be a multiple of the number
> covered by an interrupt-status register. H3 has twelve channels and
> eight channels per bank. Rounding down the number of banks leaves its
> channels 8 through 11 without completion handling.
>
> Round up the number of banks to visit, and stop processing the last bank
> at num_pchans so unused status bits cannot index past the physical-channel
> array. Use the controller's configured bank size for both limits and
> the physical-channel index.
>
> Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/dma/sun6i-dma.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 9d94a37fcf10..0a9645171180 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
>  static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>  {
>  	struct sun6i_dma_dev *sdev = dev_id;
> +	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
>  	struct sun6i_vchan *vchan;
>  	struct sun6i_pchan *pchan;
>  	int i, j, ret = IRQ_NONE;
>  	u32 status;
>
> -	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
> +	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
>  		status = sun6i_read_irq_stat(sdev, i);
>  		if (!status)
>  			continue;
> @@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
>
>  		sun6i_write_irq_stat(sdev, i, status);
>
> -		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
> -			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
> +		for (j = 0; j < channels_per_reg &&
> +		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {

look like check status first is a little better

		for (j = 0; status &&  j < channels_per_reg &&
			    i * channels_per_reg + j < sdev->num_pchans; j++)

Frank

> +			pchan = sdev->pchans + i * channels_per_reg + j;
>  			vchan = pchan->vchan;
>  			if (vchan && (status & vchan->irq_type)) {
>  				if (vchan->cyclic) {
>
> --
> 2.53.0
>
