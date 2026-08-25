Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A17395ADE;
	Tue, 25 Aug 2026 20:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787689618; cv=fail; b=YKa5fcD+dU24GQsKXrN4Fk+OTXEL1CPELCBW9uCxwvI1WhimEVNjITV89hfXMJBd2UmbJdy+7SJRRm63mqjTl+QRyVLmRj+MREY81nBw5ErNxJ+vt6QtZCa+k3NNFDUlP65xqwittBvhfSRbtyXG2fNs5b+R6W1Kxn5EA6O+TTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787689618; c=relaxed/simple;
	bh=fcr3rKOgV1HfVA98g4lg2TqzVAStWoiDb34uQr5ab9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DM1VZ4JiHVJQN4/CNjYif16FiQ914dlQC60pwiSiKZyXD9UHHDanwRDQqtA1C/PnawKk4eogEcNJWtpTbJTQJDbt33VePrtP1XIO/lcwHuQvRJZzkAwqKakb5H8XE6RphMGVLiBbU00tJTcvYH4mbR4bJQ31R3GJ2uQ/aB4pUyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DVlaSzff; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DVlaSzff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehjrf1eKWp2lxrNsw6kWvyvl6wez7WaPwjcNRONBRTWqs5Dy8PnYOv0guVhw4fiL/hr360l1u2b/ZWtRN94KRsU8EXywoV3j9MV/Mv/ok5cn/WcOPpU0gEL+J5EPO9NNewIOrXMLpq6h221Wns0EROM6RurExcnzO0mD8O3wERL0lqIYvwzOQcMMW6mYIJtGvPICzjUZqkVELaXQEFB9pR/gNiycDZIPvuqhljUGxf4U1jU34OKlAtYBFwxBVpERIE0Rc2w+Q6I3UuKxlb3+qtEbWlaK5v7yfHt6o5UkweWgIEkWW3q9yF3f6D+xd/OMpRhYoCoVP39V8kKjB6rHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJYYzGczIByzSP03izocB1rqrUfVMrBEnYxHI9HMV8o=;
 b=wohHfLvYpffLKOw5EgWdm47tFvJ9qUz/W961Vtj+3PSDtSy/5tQ25cIb/3ZFHrBE0S9/Cs+Txj7wZ4d6OjvsUGrC5Skl5PHkbE0/3ltpMdHEK8TDtVegl+GZR0+OoSMEOdrsPVXL1SiGr7wTBOkw6My2EFVEUQu72/JXZpICBvHzRA0+Hpbe2C1/+IK0qX0lkq5yU1vR5Sgs3BNVcpMC6kpcCCom9cTeJf/TXea7AwlyjuljWQ0byO17SvXfEDCTOr0xZoLx1Ki5MGAjkcLFGr1pxq5gJiU1peLyiOI2M9PrM9D1V2Mu55xyqUFe99iAzomEDjFmzQjMbU5SsD9sYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJYYzGczIByzSP03izocB1rqrUfVMrBEnYxHI9HMV8o=;
 b=DVlaSzffvnxGtWFZOSI2t1i3/TuMZ2QGgbvYPj+l7JfxBsy9NFwpyH0BjbSgtst83pcLk8EZu6A8NVDhOsKdvTIXFNu/kdMNtzGnNeKWHGFJesYHIqnJGc1xedsJMo5/e+XflzP5RPt05jomY3gsIWqY+zAIGF4DDl6hmqEtT4N+6dIlAD1kgex0cqY9vuiB0QQeWt7p4SWhM1jqtHVLGOk/K41trWKkwGNApEhPnuOyy0DAsFk7bnya0ZMp0azRGA3rSiumGNjWdUU03s9tZxeK+1X3Z+Yf0/VEKcYUvpM6rc9/R1zNl0HkxbEUhFRdMCikknpdHcLC0nIj4c9pHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB387749.eurprd04.prod.outlook.com (2603:10a6:190:4f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 20:26:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 20:26:53 +0000
Date: Tue, 25 Aug 2026 16:26:46 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Aniket Randive <aniket.randive@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dmaengine: qcom: gpi: Fix resource leaks as part of
 channel clean up
Message-ID: <ao36hufNuMA6NtEB@lizhi-Precision-Tower-5810>
References: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-gpi_bug_fix-v3-1-4c97333e6f5b@oss.qualcomm.com>
X-ClientProxiedBy: SA9PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:806:28::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB387749:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ada79e-5d2c-4516-bf0d-08df02e73349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|19092799006|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jkWI3JCb7YdBJVps2STphjN3tT4Ghcmu1Etdv1/3CTVE9f6pzNaJjLlwMzjQfqX+WMNQ+DcHZJuWSfFUnW8LHxdwGF6uyvzdy7micQ1pftc1iC4lDfz0BCuknO3b+Ut2gGAiu/mXaXc0fiO7nZBr30OGKB+IEQKbu5p2hqY+U08UbsxbO8+BraNXNgH3wwdh3fx4K6IXKNPE/dr61rPnSENXqvAOrdskygiy60gr2bTw38OQSwxppmSiXjRreJdWeIUzlYNbuZYX3prpZOsoFNaFGIRyFIGqbI1AX9+hnuVDoqj89o+gcMiICmXyFRi6QFzE8EI4xVdg7hdnrDt9/vif71/G7HXXUWnJVmtyty+8BvT5aW1FuQyxD6Chdau78ds3b0IIfd8MF6CkTj4tPtV5e7rmlFg5abZbK0lk+C6/0YhXjs94jp/pCLtwzGibWSa1swaXg6rzzoJUhLsTB6Flo0+hhOWBYaeJig2wfPwXh/33v83rp+EQRUpUDA1r85RbzI4krj/LWoNyJCOkjoUeIHtKzKGGq1XvSf7f9qqP0DHLdK8tpuHXn5oWd0yr4urIRbqTzOjPTociq54XfsTOZbJ/oVQ6Y68CslT//RQEMRTUduMlqi7MwMNihbuW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(19092799006)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nHwvmqPNX8mOWL2XvZtCYMgV1hUIWzwoKyIQvMn+oa7IcVEjdD/skYoleqVZ?=
 =?us-ascii?Q?tFfVIwcVv8vpFfsoRED93L5O94t8bU6W4YNUZBVUHGHKesrhWtPwWf0D3Uxn?=
 =?us-ascii?Q?YLTEfFO2nXD0/mP4Jxf5mIdh4X126HTYy1Db9Y+04YNZ7jdzxhA4dN93IQh4?=
 =?us-ascii?Q?6fsHc6xLMdMueGsH5rOvdOCqtfIm6G9rxIGHmd5cugjcfE/a1VlxqGcK7JNR?=
 =?us-ascii?Q?bB2a6jJZB5yIdKJWVpZ0P7vxsbiQHhaIW3UfTbWMu1Vt3EBLbE6IbOQ3Emby?=
 =?us-ascii?Q?Zum+e3E5Hbw5S19cxHn8UfwytnsdVHoO+ji6E3If0VYvK0ZQgzr8I+ymVJHV?=
 =?us-ascii?Q?ZW1zuqQpJlQuoRHAZ0EklGIVEJRTkgYir1MEuPt8S+bRhcCJqZAZyb7hoYo5?=
 =?us-ascii?Q?e+8IWWZvYMIWE4PFOaJT0lGn1DuUO3d9hxO2idbmRP47vDDfnC9mweZ7ETKU?=
 =?us-ascii?Q?GUHyCjJtZOKRNx9oNic+eByiCbJDUdOr8gTgBHfdmssDvxPxZMWbCFfjjzSD?=
 =?us-ascii?Q?j7U86vv6ZOfjflVvg0G3YKhVmZdrq0ufoClXRRRGDCmLdldxPodUZ2GDKtWQ?=
 =?us-ascii?Q?swaSX9AI35Mciv/40Hj0++DNzcV0PWpjmDChO2qDNi14X2/th+ck7LFtGgY3?=
 =?us-ascii?Q?T2E74+qZ/aZmEgPY5xUXzYUy1c3Dx1np/LeR7Qx+sjcZPzcNe+YEg8oiOkf7?=
 =?us-ascii?Q?FEPnsTMLqU5wBR/fHhDPjgRqXu2XblBaly/Ilyk4AMMTDRCxk9kRORGV/FHQ?=
 =?us-ascii?Q?jA2nEcBsX22qiSs+i2IRTeF0ThH0/cJeGGZRNzakvfSph9ELB54S2DvWWf63?=
 =?us-ascii?Q?c+TpnrWsiiBQTIFo9NfjpClKaQwKw3oD76i7WGI4E33iKNyDlRUfyz5p36uT?=
 =?us-ascii?Q?thKTt3SbcMjlO4hHJwTu2EjZpVfr8WeucH5IodnQqOW8/VwdnZyGHkKw5IU/?=
 =?us-ascii?Q?tfKQK4SNFHA34OrNUdSJO1Emx57BvwhRnxjb58bMkEX2Dqe8Ypz8CIHY+olF?=
 =?us-ascii?Q?3NvPeqwrKgnRSPZs2dBZkhj++GgiKWNCehZeaiRvDIb/o9mmu3Obssa4uAS/?=
 =?us-ascii?Q?FxpqSLG9p2XX9bxXB8UxT1qhXrL2rvQtHXLwTDIOUy4AS2tQkjS0FJtv4BNW?=
 =?us-ascii?Q?Xpu6sZ6272QHKyzJDPQzYcjmV9f2txWY/3JwYvx+p0HQsHF+oMndVaPmhK4d?=
 =?us-ascii?Q?6sziyFjIMww9xUyF0pAPdlT0KcSG9EU4qmqyvtBh4gUcnEmbRsnqEjST8CwU?=
 =?us-ascii?Q?Kd+mPMhBYem/Y/pA8LOpiasZuP3QUJZfQXu2P09lis6aghRZO1kDIEWQkEjD?=
 =?us-ascii?Q?YCZotnU9fsJFjAegPih9x/A1u1WWhus4AQcqMVmJrLxfrGYMAmD4Jh6fyHAv?=
 =?us-ascii?Q?0WAEuFk6nTA83huz+vJ/Gf+GsrVLBETFkD7FoPw56QN9sOws5TVadWDfG44w?=
 =?us-ascii?Q?+2Tt3KKF0e4E9h6xkckEyLNfVJaAPhrpoVfLTD7CxmkiAmv8aB6WvwAQXifB?=
 =?us-ascii?Q?f66THB3VKGcBDlB/fWZTpQ9j3o5nz9wFYx17LbND0BZ+bBp77MHB31KdC/bZ?=
 =?us-ascii?Q?3UXMEUm7hktnFz8s+mM0fhIXWK30wPBW8hQVQ2ADyL2Nzj52lJ28iyqIe+0C?=
 =?us-ascii?Q?SLiBtaydi4ZPXgRAKIiGzvNasNnmaRlBRXo7TUgCvRDQQBFeu4Md1B1BB9KU?=
 =?us-ascii?Q?Y25i3g2ZlgRq8byGTtA3G0+sbH7bsLDLrPCrSvLboPhqrYieEncLJaWFPppg?=
 =?us-ascii?Q?eg3J5UpESfNfjPDshOAEMGEoDvuRMY0UYu9/OiimXq+f8T6OuOk1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ada79e-5d2c-4516-bf0d-08df02e73349
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 20:26:53.5410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHGxujgz3yrCi0Iohw5+mod94S6LJWtcqKIneK1OlKj/UBdyvLj1HZG0jm3cihhigLzoGdHP+FGqmbxT0DlCxmhRbY7hjK2AHkiJIElOEecJPrOjDosMAjP2wD4cpBlT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB387749

On Wed, Aug 19, 2026 at 05:09:31PM +0530, Aniket Randive wrote:
> The gpi_ch_init() error handling paths do not fully clean up resources
> when channel initialization fails.
>
> The unwind paths iterate over the original channel pointer instead of
> the channels stored in gpii->gchan[], preventing previously initialized
> sibling channels from being properly reset and deallocated.
>
> In addition, gpi_alloc_chan_resources() allocates ch_ring before calling
> gpi_ch_init(), but does not release it when initialization fails,
> resulting in a memory leak.
>
> The event ring cleanup path also leaves the PM state unchanged after
> freeing the ring. As a result, subsequent cleanup may incorrectly assume
> that the ring is still allocated, leading to a redundant EV_CMD_DEALLOC
> command and an attempt to deallocate an already released ring.
>
> Fix the unwind paths to operate on the correct channels, release
> ch_ring when channel initialization fails, and restore the event ring
> PM state after freeing the ring.
>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
> - Updated the commit message as per Mukesh suggestion.
> - Link to v2: https://patch.msgid.link/20260810-gpi_bug_fix-v2-1-60555394cbf9@oss.qualcomm.com
>
> Changes in v2:
> - Updated the commit message as per Mukesh suggestion.
> ---
>  drivers/dma/qcom/gpi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af..c41bfac65ddf 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1965,16 +1965,19 @@ static int gpi_ch_init(struct gchan *gchan)
>  error_start_chan:
>  	for (i = i - 1; i >= 0; i--) {
>  		gpi_stop_chan(&gpii->gchan[i]);
> -		gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
> +		gpi_send_cmd(gpii, &gpii->gchan[i], GPI_CH_CMD_RESET);
>  	}
>  	i = 2;
>  error_alloc_chan:
>  	for (i = i - 1; i >= 0; i--)
> -		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
> +		gpi_reset_chan(&gpii->gchan[i], GPI_CH_CMD_DE_ALLOC);
>  error_alloc_ev_ring:
>  	gpi_disable_interrupts(gpii);
>  error_config_int:
>  	gpi_free_ring(&gpii->ev_ring, gpii);
> +	write_lock_irq(&gpii->pm_lock);
> +	gpii->pm_state = DISABLE_STATE;
> +	write_unlock_irq(&gpii->pm_lock);
>  exit_gpi_init:
>  	return ret;
>  }
> @@ -2065,6 +2068,8 @@ static int gpi_alloc_chan_resources(struct dma_chan *chan)
>  		goto xfer_alloc_err;
>
>  	ret = gpi_ch_init(gchan);
> +	if (ret)
> +		gpi_free_ring(&gchan->ch_ring, gpii);
>
>  	mutex_unlock(&gpii->ctrl_lock);
>
>
> ---
> base-commit: 415606a7be939835db9b0d6b711887586646346d
> change-id: 20260803-gpi_bug_fix-b0b80ef315b5
>
> Best regards,
> --
> Aniket Randive <aniket.randive@oss.qualcomm.com>
>
