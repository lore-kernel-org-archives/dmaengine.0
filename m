Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793987348;
	b=Vi2ykWJf45MOtdjv7JFohF9ifwr80oM1mrpWH6NJOyhjf7aI+SzEsn5gsx86JbM7MlGc
	 CuFhkC89Pve4NivJeG8TWsxhjB6jVKbV1m9MyjPfZXiez8lbHYZE/EmCJ55PwTz6CURBW
	 TrpPdonNyEdvp1TkFZb80+NBG/4G3zT/+bdUGGB1c1/5rdTo8CU+AdIcJSDeBp6zzaoKj
	 PjaYgzICyjfC1dZql+GdvSCrdBF05xNm2aeR0CLyls5uPDWeBIp0eZ6w07qGtb5ooWAe/
	 1j8Wa6c5VIczDvnehoak2f748z69BuYXI9JCUAstt7o3LGEmhkiqOLaYg2KpEepjZwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987348;
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
	bh=1/CPqvQ0yqH320FO0/Ce52aHenybZyQTGeEOpzOCKDc=;
	b=LAII73/Y2zPd7oOKHQyZlq8KJzzJx62+TiGKnr/WjakD7wil9zBwm1vJdSxEpmlt8qNs
	 wcAtQM7c6PFA94r154lx4Xb0NnKahieLiBvq0uqQko5kEvss9n+R6X9iDMZyKKQG5v6oT
	 ggyn+RFbI4G8+YOTp12clr8negEOcREFUVC2wUtgEDNVoJvTSbNZT3P0KtnX5Cx0UADRH
	 0hEArhuAccjcjDlPekofostQQ93w/P0gBHK8mpaV1gx86IjMZk6GMeHNtF3wsL2LAP8rE
	 DQSAKmKgztKKYWDtddod9FLqrEROF0umXzCmht8j07wy/EBd7lnGJERyOof0l3fYyFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XBXRfglq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.26
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46B8606A326;
	Fri,  6 Nov 2026 17:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XBXRfglq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGOrz62wcID24pSjy0QcUzQ+ual4Hdok1ayTPYV2bzot4KNb7mGM6UYVNHy+ILz6Wn08Bi8TpuIzm03eRmNSHgGL8Es8K+38gZYtbEc1qf+GRGj65/Jjq47vll7UIatTviTHvneOUnsd7M025fP7kcImN9Lm9xpzo+oRLAefCkNd5Q6pt+3Gdqn9tIu18sb2Z4yR2E0ehTHMpUdqpwzirahYVGgHAyvWkRyKuMBxWP7VMOFF7WZIne8YDBoRSyV539u67oLsja2s1wJ037J/D/EVC3pADm2OXssjCLN6cBXfVQz5WZTg6EVw7zB4tF/MERD8+AF2oyxjMEU5PWxzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/CPqvQ0yqH320FO0/Ce52aHenybZyQTGeEOpzOCKDc=;
 b=U7/VmKgahxvHCTy1S1ZxTDuknC14RQj3iudlFMQVzUA1wfmWOvAnzLf97bjkt5vimwYcSPTNIf3JhOW9H8J19QiNhQUStn4J1vvq6xggyXdG0jYQ8iZV0EFfwkozPNvT/I7lv3ens5WQcugpKA767DjrspVucxqMC8a044RYflZvlqhdXxbksNWfjHGSgCpbBdxGzrXEwsKcdtxTr3nbMvuWg6xEJuMTo9YP6Zp7aBsw5E8A8QzlK2rUOf3qMnCrm2UsKtBzqm7IOHF3RTSqBRgo+PS+tZ4j8BFjpjDN6U9mh0L+xaeZv24qXd2OwcxY69C1O00PsRu5hKEFjdy6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/CPqvQ0yqH320FO0/Ce52aHenybZyQTGeEOpzOCKDc=;
 b=XBXRfglqI2Je4ZhAL9BS2DwxDnEV3nReHyIrmq3Kxa4WOsoOV1Z17y8fA2Z+iLyQLTmgQP1uFu8Zc45eAvX1Sv6AajRNYvwrOQSAkg4FKeaawckZ5H9SC9gbzKkqq8SOteajIdNI4ZtGuAWUhI9b3N2JvgD/5UYPV35tMtGdjFH4LHMEADcTp/024bPiXsIi8L0RhWC0rcSgLT0vUwKdZGeQ8sJ8dpHBuA441leP+ZfZaEkF3en+SKdraFM+T4WpOyiVUjrNlsxZtNSCvdLfxEC1L9ygGLofSo2TI/fvxqcYRRrPZAwtdQVv+yjqrzTbl/05pwRMsNk8NqNsdt5Jsg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI2PR04MB10268.eurprd04.prod.outlook.com (2603:10a6:800:21f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 17:49:04 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 17:49:04 +0000
Date: Fri, 6 Nov 2026 12:48:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.li@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 5/6] dmaengine: plx_dma: use spin_lock_bh() in
 plx_dma_process_desc()
Message-ID: <au4TCjPFQN0mPIv4@lizhi-Precision-Tower-5810>
References: <20261103155202.461725-1-logang@deltatee.com>
 <20261103155202.461725-6-logang@deltatee.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103155202.461725-6-logang@deltatee.com>
X-ClientProxiedBy: DS1PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:8:458::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI2PR04MB10268:EE_
X-MS-Office365-Filtering-Correlation-Id: 6936c09b-145c-4756-d404-08df3c2e3fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|4143699003|11063799006|261026140227099003|261028144727099003|261021121427099003|56012099006|261102123227099003|261022105027099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	QSu8ujRa9A6DFcSXKD7ZId5enTzQSq/KrGiTvBICWxvyXAIDGHqIfvr+CO13g+ABoH0XlJ8ygTuy5jbqVIORxLu/1oti43Tz2dmxWlGiuST+Wli/WfLmX13WikyUSaL/kflW1CLgdFtDDGJq1I3VHqWEFJBG0MgjfJv3D+e8Oq3aNeidTMGQ56STPhQwq3Vz3Wvz/mTJNfpZwk+vBMpYIZFNQtdUitON8FztO0+GZs0dd2MMr2UAN+9CKKM+/r7tUQAvu2nAUBsNl8AdXtfZUo7HxcoC2JI7Jd3EE+C4rt2zkitqgQXkLbf/6IAfGse+mF2LHalGRDrTOlmU/ou3XIHxbD6ltO72D78EnxqMG8guXkEBxRHtkiJ4ZBlKXxrkCN1S5kYSmL0v9hUTvddmTWTeI5XYwPZshrQHzzVstbPeVzdiYf7t40TqZhX5fugfyVL5o0z4Elqo0a1gYN12bNz+XulRWLKPyVtwEOOZfEqdmZlpF7ATDhKpI5hSwdDXm5KNcylDD96bBMiVmLsKuG+9SCcs9Pvn4PPSAVWV62VdOm36DSEyIaFZnD9MnQR3GO7V6dCTFGpsjikq39lC+OQxFSipL/o/mPincHHfhUs2T+cvGFwp72eAJ6ddzi5g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(56012099006)(261102123227099003)(261022105027099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I/lgJyB+PKZ3LFdjFvmtXzczoEE0pwVPYgRxdUWYwETZyO6IFc9Iv3vRi7fU?=
 =?us-ascii?Q?tTP19mNSsEZdAzvn13VRm3Zu+C0FFjgqn/gWPM4YSkqbd0i/H4WjQMhwoYFt?=
 =?us-ascii?Q?FDdybCundWoEoGnqz3JhjQdarIa3QspxwLkxdTFfkHIkW03CGiKzaBwFzX/f?=
 =?us-ascii?Q?gBIwvc2/8t11WRCEjoalErfE/7zaZZIHemwufFvxMbZEcrFZ9ZXK94E2TWyY?=
 =?us-ascii?Q?N6qhB6HhV3iUiWp5CuilKKQk0NhdrhKu8U/9XOArUgNARzGoRVHdm8CK0NKa?=
 =?us-ascii?Q?OFkqST1qp7lpXPNlqKnOtdgvHbm79nT07Jl62ONrRrs932JH+bXPbaeIB0vz?=
 =?us-ascii?Q?ZWTpdMpc+oJAjrALgQ7zveKatZjisJhlxD5DJPojsiCJc4wKwJ/JboaZJ0W2?=
 =?us-ascii?Q?UZZURMMH8BEQ0QoSEkofWNELYkzQWPb7Fy4A6Xd8CGTHM99l/v7ZVk7N5JRb?=
 =?us-ascii?Q?40aFbT1ZZDSRllmmyXkcCXAY7CYDMr7WnhUUYI/mRinoEpwRMREvDJbsnX8n?=
 =?us-ascii?Q?Moq4fa+rEeDQVWnDduSTyQK2EnGsZNiz7a7B5HLM88Q9Q5zM/BHpc5c3CBb+?=
 =?us-ascii?Q?udY15p7sZb3d7tHEtZ52D8kuJxZEhpiBdWVNYc0B38a9pYFwyAen1fHJd8j2?=
 =?us-ascii?Q?nZqpQ3pAdbsqXiPyZ4KXzWYqkRk0qOt8+OwlbWDE8PjxLCiO+BroKk/0LGyT?=
 =?us-ascii?Q?c4p6zYZ3vgvxaf+9PWA8KR3dh21AD+RcMEMtIisl4rTuCBy2+meNcTD1Q11Z?=
 =?us-ascii?Q?C3Y0iOaE/XmIQzndMReA5LE2oFa5MtnCG2yJLYURL0tLJVmkNNLOMKLqRqTg?=
 =?us-ascii?Q?KhrQVwxv0JAqiyXy3R16ezMmPJZkbI/Sp8ejOJDjV8PX3PVxkglEFeg49EFe?=
 =?us-ascii?Q?3CYIRAFvFtm3nysOOjBYvaNubihNJ9lR4X2vRYfkKTPtqEoq86HbiEimXl0M?=
 =?us-ascii?Q?TiIkxf5W25st5MO0BnKefWJqaqS6VzufWoXbpnNGilUospBu5r4XYi6L3aX6?=
 =?us-ascii?Q?1uKSZAAxnC01V/Ibpy6klWwGlQqSchnydyztSN/QltZcBhD6L3Sdo+99Xg+0?=
 =?us-ascii?Q?H7mII+YSpEi70xR4fXpM32XkrUC6e/RAQGGZmA9WeN5IWxArMYmeUQ24XgS2?=
 =?us-ascii?Q?arJD1xQnoIXL1gkRZyV0vAbAXFbcDyCVL6YHE1UuboI4sk+BNWb9wCeicA2s?=
 =?us-ascii?Q?jHGYsLUtu96h5x3N0k3pg6iwnIrdaciBJz7UHA8l7VApGGPaS2f8h7FYBvsE?=
 =?us-ascii?Q?IT3rpMJhhg+Wbvzq9CaOojsiqm3ObAwZrryYITwR3hZrlqQj3HwcIsBU8YQf?=
 =?us-ascii?Q?aZgf5EKe5QXF3jysKFux6yg4RalFdiV6N1WVYC9bIwZ4uTXpKynrZMMuUORu?=
 =?us-ascii?Q?O6ozkv1Nf4A+IaSiA8sX0M0ELUXEZ8ngAM2hXIP3yYKhlIQ2g3tlOXGOrRwQ?=
 =?us-ascii?Q?vCbEwNYEV+mfR0koJfMftIVikwxlIG6pMuV/ff+zkcpSX2e+BIYu7iyaMkbf?=
 =?us-ascii?Q?MDWoVaSo0h5PhKAVM7j6vdL54LrcdlDIGzN61k4xD5ieT0PX/dyzajDgHvMD?=
 =?us-ascii?Q?tmwHGuPSUSN6c+5rJyH5wmUYEPEvvSuH5Uma0+JQKJAbXRj9jmJY2ksmux9T?=
 =?us-ascii?Q?Z/ACD/hrrMijRdxsm80lnmez9B2yz8ECeo8+/Owyx2C/vORRkqKx0dGv16TR?=
 =?us-ascii?Q?vTyRPApxI79ja5KS41SIZ/4vDGgEvB+GOhmZT0Fj9y+BNQo08nHXaz3nC9B/?=
 =?us-ascii?Q?l2b1FdvFvuuN8ZuF5Ob7IjV4rDztdVnTGLnZubJcjx3CdzLZtEKr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6936c09b-145c-4756-d404-08df3c2e3fa9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:49:04.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRKPKxOz7dT5j0CYlKTUixDbdiPlueey0CPL9mAjExqsFYtcc2sNtNnVF45cmaM6ZlFEDO/VbtRDoP9C/XijS9uv1EB3kAYanLkbwUsSmYSDDvNRnVWxSOrF2TzuRfiS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10268

On Tue, Nov 03, 2026 at 09:52:00AM -0600, Logan Gunthorpe wrote:
> plx_dma_process_desc() is also called from plx_dma_tx_status() in
> process context. With a plain spin_lock(), the desc_task tasklet can
> run on the same CPU while the lock is held, and spin on it forever.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/dmaengine/20260717223217.B6FBF1F000E9@smtp.kernel.org
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>  drivers/dma/plx_dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
> index e4243b66f933..8c4b19d681ad 100644
> --- a/drivers/dma/plx_dma.c
> +++ b/drivers/dma/plx_dma.c
> @@ -138,7 +138,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
>  	struct plx_dma_desc *desc;
>  	u32 flags;
>
> -	spin_lock(&plxdev->ring_lock);
> +	spin_lock_bh(&plxdev->ring_lock);
>
>  	while (plxdev->tail != plxdev->head) {
>  		desc = plx_dma_get_desc(plxdev, plxdev->tail);
> @@ -172,7 +172,7 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
>  		plxdev->tail++;
>  	}
>
> -	spin_unlock(&plxdev->ring_lock);
> +	spin_unlock_bh(&plxdev->ring_lock);
>  }
>
>  static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
> --
> 2.47.3
>
