Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793048768;
	b=a92sq+HUIEerX2jPXaye1Czs+haHGBwExzeB53283cYE6brqiVHYZwaK+qfOyjXmVRr7
	 nh+P11HofqKv4DcLoDicKTdMfmJMyC47jfPTnl4JN4tWUg2nhHjsj4/ML1/xM6eOL6NW5
	 dfxd0GGa9W7n1Cxn1i75lHIRUNkbWq4TnIXy3WRdCGvcS+nomSO0Sj/Bmp+mVvDZ2QMZ7
	 AKNAOG/v+RNpBoWzeEMINRolSgETrlSfJRfVRFv1pVelpvg0Md6hV9Z6xQ5N5iljYrebI
	 uiis4o0kfa9b9p0yAZMfb4yTj/6hDvpoi0Kmqaq2tnOVoQXp0g1RYONT/ZexpIsCtVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048768;
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
	bh=ex+N4iw1BQm9/uXWYtZaQHHvnU02L1SGiqI5oyKQiU8=;
	b=IS5bBiSwzLu0WGMc1swPmtcUSfAp5HpaFHdjx0H1a4CjvwTttVS68PrCx1NuCd3ooxU9
	 lmKzQMHqh3EYdCXvut9UO2CphOp4klRcK0LyWKiux0HdRAVhPt/fZeK4GOevMo76D11OZ
	 ffeWY7SHyD95XYXwBM/1XOMgKCrrswcbL93AL69xPPhKkbzku2CR3TfxasEmYo+dtAxK/
	 XFQkVsCfhJSlsa/TZ4eDwUw/JEqXmXEP+L0ilpkyy5/dQyH0ioWkE64YxQoqt/kp82HV9
	 7O/Ngl4/wvLFF4Tr5NJlMd7mulGOamBUsge4ESMyORxrYP0kPO/+Q33t+5GBC8LBZGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JcDNDD6V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.13
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22E7606A31A;
	Mon, 26 Oct 2026 21:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JcDNDD6V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7NnWJuWyYz1EmbW3BhnHC6vekItrTNXCsSrjPFFod1dPhz/0qVqj1qCYo2C3TW9ad/2ra/AtF3Jf9U8ZAVleXz0J0aMPNtX1tOsszA3QVtPHhfJb8nPMM7VZdJFCqgkCXMf3risQv0M6HNebIzpWOYjDYOL7MRPh7j0Y43/Prg2Xu6eoJUyePEzA8K1Ap0u22Om85Nd8e1SiKb/JYJ4G7Sic+9eMTeU7214zzUoOHItT/n7iDstgJ5okZUUF5+P+RsiQnxIN+kKe5QfT0xdUblFl/w8Bej7wjdePBRvM6J8jHlQlcNCEW1MbU9Gc3/n3WHK9ewmdWXIFfKtUz0NbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ex+N4iw1BQm9/uXWYtZaQHHvnU02L1SGiqI5oyKQiU8=;
 b=c63kXaNr8RjLVFJL0TZGrlKix0qcLkg7KLqLimbuIv+VjVivLbH4MgumBUvsG4flhQc6/eE7n7WmAyHGpLrBgudErYMSHuGWVmGHGvstfbLImQsFvxkahBzGpzYCmKyswEbh72h/BPKMfKPTAH3/yLBGgkKF+GZx+4cSi8ZFc/1tklrQkSY5m82tXVGP9d65KQJ9gIvF0W2OCo/owhTK6xTqccIo6uzjFBz6f5mjeO8Iy8Ck+pWbvhchGUoXOlWk+tTDes9YOm4U2P+shF30DPVRBL2/Zt4fok74GUlug5FoGOWZxQ5nvteEXhaTxjc4zmxCLEtsuVCdbmBototvBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ex+N4iw1BQm9/uXWYtZaQHHvnU02L1SGiqI5oyKQiU8=;
 b=JcDNDD6Voj5b5YdCil+2Nuqj5mvXbP9AdAThUVlJQksnJ9uW4zmvbd1D2/6/D7BDS+zT8R+b07hCQgNNH3dk5qOwwO/yUgPhFCOuIcvb08bFN889pklZI3XWpCPzOdn6Ghy0s/juA798P1GikXaaW5p2Zk4283YKNKlz5nihez0Qqj4J2TeE+j7rIcFSUGIAT9pRnhXd2FBij5E23F99QfnMbhwvtzw0TGbfOdShGGPx+ctWHHy/JSCWytSVn63Iq9NGiCXz73AkMtLjVN58+8J60iyFzOyqfszkfkS20iFbBsEvTmOiJEv7PutLvwFhjaDTX6IAhDoEIt/Gc22ASw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI2PR04MB10665.eurprd04.prod.outlook.com (2603:10a6:800:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 21:06:03 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 21:06:03 +0000
Date: Mon, 26 Oct 2026 16:05:54 -0500
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
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] dmaengine: sun6i: take the device lock before the
 virtual channel lock
Message-ID: <at_Ass1wf_4vequG@SMW015318>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-3-ef1acb0be768@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-3-ef1acb0be768@gmail.com>
X-ClientProxiedBy: DS7PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI2PR04MB10665:EE_
X-MS-Office365-Filtering-Correlation-Id: 633d5c25-905c-4ac9-2059-08df33a4f1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|7416014|261026140227099003|4143699003|11063799006|5023799004|56012099006|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	MLc3497J4tZpQ7we4a9iaM29kouXODr+9hjATERMl4VnHfXYpohfDISCIEYCi/7wB3yo8Dj3EYZtdU47qdWswLr8E0gXmnTni9xfAMwZEdIE5xwOyQzlaINF6NRj00U/ZCdLtT5GhJfbjbwF5GnC4FkqiuZS/tvYGWrvCqPXvTBqG8IYl2wAwgk8xzf1qD0LVnxXQGsEIUisLNF9JzFq0oMNRZ1xfzMPXXceHyNxubtt6CfP8z9zqcjO51gMICZ/o2SQEz2jt3DdLt2+Ms5aiT5ATC9VN/NbniGGenPxfWYOQ/loFTbMK0MQfS/2FXz3fW05vSUqTRrLnKlrkhpVlpvdJ7gNJGxEzzOTHvKYsQGYjRo/lOnZuc+hw3M0/vwx6vIQ97cud3LuRswQKUC4JiPl1gYXwU4zPeuwX95NH71naD98d/RWG9A2LB1YGlF1hJD9P+X5H92wrDZwQUUxk7MWRqbkzYaCDhyNkRJTHLqkNnK7oE66FYbz8lxVwdLyiQD/NAtAMYDrckbJRUbT8srUeqc8rMRvWYaprNulYhHkRc3i/b9zv7oBIbJfQdWC3H/XsPp4uoCYBxkqI/MShcobi8hHF6sU/3jqGObx+KzjdiupxtnNGZ8LnsHsjhfYeqz2xyK6Wqbva1gMJUNlbY9AEgm8we25xfyq7U2uf4Ihz/06VU2dP/u1/oXf/AwFv+MX676ivtpPmf1f4m9O3+PedEukJ1/iWsy2JkAOrrY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(7416014)(261026140227099003)(4143699003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qZiimQLOofEAJmXQkyuthFaRzeHsFsMWXhNdkgwY0B2nwMOWr2/cjtQjXqa/?=
 =?us-ascii?Q?As8ttkChbmJC0fT4SrSLYwoSGdSn6aoElv59kr5uGKnabEHe3vGWrvMgJhr0?=
 =?us-ascii?Q?BJ2m7pJvPdjEtbs97AVvKogQ+Zb71RsmG9ecpT4fQrzJNvZwqQJPfxnzrHCa?=
 =?us-ascii?Q?RVoKltxDhGKmh/KM5GNUx48icDejIgKVPWRc55RBFVDeUK0oDEYrpwd8dTSW?=
 =?us-ascii?Q?87v4+TVa+QqelpMU0Z/Lm4H9ouFKWes/jMdT7au4uD2cFzKRwKfLKzParrkS?=
 =?us-ascii?Q?JdHQcg6CzWK30tTgZTV5hO88i8SO/LYtHdZUG0Qgq1JSrF4fGLLzI4LfRZ2J?=
 =?us-ascii?Q?0bBExeAggxCoDhBQIavxBU/uCYz/Mtuj/ahZbZ+0Abfr4AtOAuvBC4S38Ibd?=
 =?us-ascii?Q?IWP4kWMP+8tq0bLnbvQiaP93BJC2fI62F/lIJwt8m5GJwZq05E5LoNBZ8wlf?=
 =?us-ascii?Q?4RyUtp9zmYJVWd1n2EwyxBrba5cXsKTBUyQRhg4SV8e448Sskv90gW6zinsB?=
 =?us-ascii?Q?qBqPiVThaqUxvRERJdAeOyBg5vUzAwagkpGC66EULHVTjxlQbYtTzVeY8gZS?=
 =?us-ascii?Q?qcuNnbzbEDnkkKwp8k1RfVUiz0tzqfVH4qR/8G0pdb8ISqzR0Cx6wHWSXnit?=
 =?us-ascii?Q?BaNQFp6D+++Gv6ncHxGdRCBaXPEyi+r6jLHMAo1+7tn3m8/Y6/wC5WjWrSii?=
 =?us-ascii?Q?Zk7MLsRKsquJp/KQhLTVtAuY/o1Nbp5Vm/P7bt0KjwwKyRdwmhPPvEWpKGgG?=
 =?us-ascii?Q?pmieM9ZBYdHmOBnIGhLxviEMn4TdNMJEpEyCXoce4GuVEIKtgtAhb6CmH9qt?=
 =?us-ascii?Q?q4QTUn1MT/OgISmjNB8lAjQSjTcCmPXxWPL3M0GnpyTzny2nYIfzbDgwTCi4?=
 =?us-ascii?Q?U70ocNoESt8qlq6ouLQg9WPL+CPRk70XGZxIzHAlsTbRhl68gDb95Z6mkgj4?=
 =?us-ascii?Q?2jjEhr9r1Y4I/rchorNQBak+qMX4w31TOVM29u3vwPUhMsRMxiVOG8sK2gxB?=
 =?us-ascii?Q?bQinFCLkFX0iAO3+IjVqFH8kZsF4XpCdAJLs07dqY0xUAkbJgMftttz49cEE?=
 =?us-ascii?Q?rXVasjownd7VTGgZEZUNH+fw3fbKEUHfrWCHbR8o11Is9RkOEB4bzi6CRuBQ?=
 =?us-ascii?Q?5N6dMyAnXDNDXtEPYe2bnarEqRg0EGeqyEK5YIXULge0vt9WODtzY4L83whW?=
 =?us-ascii?Q?IehVRfZQNGRWw1Dt3CKDniKItRECza3dEXWORIwKXhaPlkOHpORagG/16aH9?=
 =?us-ascii?Q?ggOlbu7T9ZF1mjQIQ4wrwEiHXtCVi0x3TfsbekR7ztzDGi1W8EFucEWbO/x4?=
 =?us-ascii?Q?bOD7JhFCg7IjsisxCN78QCHsfIY17BaHpbiH8Sr5xFUTd/vDSAuSvHuBwACv?=
 =?us-ascii?Q?7w3tFe9xtJnnTpj0M88BMPhk355V7b3bUK7UCAW4PeLGB9xcbc/cKXTxGld8?=
 =?us-ascii?Q?DksqMoibjDcP5MyBDeqbPC5cLw77PI2sqNLm0yPZe7gQbnRZWpy0VCoDp1nK?=
 =?us-ascii?Q?McpirbImRC2FLaDrk/BmnU27ZGHzVOJgTOSL7kiE2eDU9J4lbfFOMU6PCl2g?=
 =?us-ascii?Q?6gS0lDiBaOicJ9whO5lX9O6Hxi0jMtAVHqJJNxFkJVhBiJKibHqd2HmF4h6x?=
 =?us-ascii?Q?F2ONdddR/jBGKOteGu90vhJAKI9LmPacQguOdPEmzOsBIHzysaRXBRjha9Qp?=
 =?us-ascii?Q?tY3FMZni9uV4C22mPD75Ee/Sy8I6AeGuwoBZ4qNxOpoRWkpIPF7MGMeS1ASO?=
 =?us-ascii?Q?1ZcLYvXzs9lD3fGJSeVs325UTor1cqPNZO+ch7Ti0XEm0UxgxoLv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633d5c25-905c-4ac9-2059-08df33a4f1ac
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 21:06:03.4267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiHRLeKSCwNLFE8vntf3FEEJjwnBQ51pPjkiRI6PuNf0lQey5S4xSU3FGrJRq0uo32NdVn62XUhu3hBxP1Yjg9tNjz0VNr5ZYNW//lR5uTGSzP/bz/RTJTJ3J1SMvHFb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10665

On Fri, Oct 23, 2026 at 05:38:22PM -0600, James Hilliard wrote:
> The pending queue is protected by sdev->lock, while virt-dma uses vc.lock
> for descriptor lists and cookies. issue_pending() and resume() currently
> take the device lock inside the virtual-channel lock when queueing work.
>
> Take sdev->lock first in both paths, and inspect the physical-channel
> assignment after acquiring the locks. This establishes the nesting order
> needed to keep allocation and descriptor startup in one critical section.
> virt-dma preparation, submission and callback processing continue to use
> vc.lock independently.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 3a6525dd3d32..435d7daa1c0f 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -952,23 +952,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
>  {
>  	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> -	struct sun6i_pchan *pchan = vchan->phy;
> +	struct sun6i_pchan *pchan;
>  	unsigned long flags;
>
>  	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
>
> -	spin_lock_irqsave(&vchan->vc.lock, flags);
> +	spin_lock_irqsave(&sdev->lock, flags);
> +	spin_lock(&vchan->vc.lock);
> +	pchan = vchan->phy;
>
>  	if (pchan) {
>  		writel(DMA_CHAN_PAUSE_RESUME,
>  		       pchan->base + DMA_CHAN_PAUSE);
>  	} else if (!list_empty(&vchan->vc.desc_issued)) {
> -		spin_lock(&sdev->lock);
>  		list_add_tail(&vchan->node, &sdev->pending);
> -		spin_unlock(&sdev->lock);
>  	}
>
> -	spin_unlock_irqrestore(&vchan->vc.lock, flags);
> +	spin_unlock(&vchan->vc.lock);
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>
>  	return 0;
>  }
> @@ -1057,25 +1058,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
>  	unsigned long flags;
>
> -	spin_lock_irqsave(&vchan->vc.lock, flags);
> +	spin_lock_irqsave(&sdev->lock, flags);
> +	spin_lock(&vchan->vc.lock);
>
>  	if (vchan_issue_pending(&vchan->vc)) {
> -		spin_lock(&sdev->lock);
> -
>  		if (!vchan->phy && list_empty(&vchan->node)) {
>  			list_add_tail(&vchan->node, &sdev->pending);
>  			tasklet_schedule(&sdev->task);
>  			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
>  				&vchan->vc);
>  		}
> -
> -		spin_unlock(&sdev->lock);
>  	} else {
>  		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
>  			&vchan->vc);
>  	}
>
> -	spin_unlock_irqrestore(&vchan->vc.lock, flags);
> +	spin_unlock(&vchan->vc.lock);
> +	spin_unlock_irqrestore(&sdev->lock, flags);
>  }
>
>  static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
>
> --
> 2.53.0
>
