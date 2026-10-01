Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456C0531637;
	Thu,  1 Oct 2026 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888521; cv=fail; b=Q5CGyuZnJYt8gllbRu8Q5IE5J7wmsJ+5Nr0ZjkEg89V4PSFKlcrwf1g2Pr1CZcwfWEnflWJP4Q3sws2tPC/LCcT3BLgfCSKYiiNyFtnzPHpXjsQaCmHWnGilplqWQgUuI6PxqhuADik/AkB899fmJfSdxQDvAUtKDngFjfY+eyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888521; c=relaxed/simple;
	bh=9DcP5lnl3dz6CsBjLLBo+Qro/Bi557f+Wl5nrxh7iSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SOdcnFdshnKiU/zVzoWsgkh8Mfq98Bq6on/TaJCi9tTgYyxTvHW/En03ppbXIQuNRVKb6RbBDm24Zvuo8icLicrqMaCUEevKID0XlkcSFYvEByTUDUd+n6DxewF23cUV9aSednTW9O74/MMb+By4y8nczcKlnPR5sYc5QERPilg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bV2vuDXq; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bV2vuDXq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGM36nHrKUtI8DPsBX8A3mtBETcADOYMf4WbMxKVR92dO1bj40Vmq5sXLZJrHFyikfq03vXIqNox5ykqT7aWkWX4qXsG+EVSvpQW4ROJ9oZ6wiGVfwjfvDhj16oojrEqyOKG242zwiilJz6VsBONoVQTZXOMQ0SQ3exxVaEINSwVfsEExX9t0SKfiPT2rDJFJIm7dmpzW4K1W2sIDpY5n+3MsfE7RZBgmjAo+ov1Dgh6pNbkVdn1oK6rKKnfIMNYcYUz6lyAmBXWY7A7UQfzO9CObdpgRMLW+W6JvKqT3pqpavHvL1lOS5Rx0WGMKrrO0jXS8BxmrxlzHIGzePMp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw7U0NEsQNflPs5VGDCQrj/UKUlD082vwhlg1lOzQKg=;
 b=RftLXevPa8mkWAnl5ICKM5PmwN2qyRYlIj8c3vBTgvwphndASrvH1xyy3nD5uwhk3NVQjTQ/gFApMpNQKTgnrj1deHq/A2LiQhHiOWFlvi7J84DnHhDSDg3q5ZIYPJkcO3P9C0Hg2dEy6F76W1FLphDfoOng5qXlgejNDJZU/9pjLbvcc2y7A9p3/157TWuEIYJwNVWUzT5WlRat4x+1NAYpXk10l0rtQMODgp3ok7aFsBUCiAPHD1GGkT5yNLtbfU4p5/qgoGqYRcWKEBXjraBNLRpGZb7MIjFnfdwvIXLFW9inaOr95TgysuOkFLXJG6yLyDSo+CtosOYLLb3s0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jw7U0NEsQNflPs5VGDCQrj/UKUlD082vwhlg1lOzQKg=;
 b=bV2vuDXqnMRDQfRFU7zisCRw7tAJ8GTrFmzbEzChzoc+x7iTRU9l5HX+vLlQw/EQCx90ZHf+M4VD7y7dekqgkBF+Oshy+q6DLZIuJQm9GKkFNeKRI15hHhX1MIDakP9Wh5kSRAkf7+mCJDGBCD19rUlshzOyvmKh5bG7zsZ4Vqw4OZJmFWh1rV2iP08Vg9oVi4W/ejgLwp2dEQyl22SNxIDZJ/bfLn+YmzUFXRGaMLM0AsQZarGN5RQZ5bC9GzLV83bYcKEm7burfl/dw70/ZGxXBmRPHOPDUbJ7pdYZLhBpthG2IdA2xygqCJ3cILWCONRtV5JGZmM4SGfa74nTeg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8333.eurprd04.prod.outlook.com (2603:10a6:102:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 21:01:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 21:01:53 +0000
Date: Thu, 1 Oct 2026 17:01:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
Message-ID: <ar7KOF18A0Ijg24y@lizhi-Precision-Tower-5810>
References: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com>
X-ClientProxiedBy: PH0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b72f2b5-863f-4af6-863b-08df1fff3838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	WNiKicj/eQZGpQC7ujFmDod7kBaLhaBzW6UlYEn406OVF5gHFZL5fN+MXjNohKINM/rOt19WgP+ilPTU3jJV0dJc7I6qBJZNjtNM9i5MHkt/WZXC2sUb+Ey+X4LGuqdyu1RCa/4uiDGZb4wdJiaEq8rrMpTTMDh3/CgwXVnrmtSc7huZStwQEDF4hnvM36qxbSey/F3V5Q/h/QXfkbiew/jUJAsCOumL4tFx9VfP++ZxMQf/+yXrwMVv9iO7niPsKcXIRAS1m1TiZumYmt5HBgKEEbM8qLc3xM+wPbmtTiPQjEd3mB+r+rY9r7ioAgeDug+z+5DRBv+3ru+xs+JdINQSBILCDv/e7Yw+bU40eAvOr2rfkEKY7NfrdRoT7ObPUBlNAFbwJdu6OAeoARDAtJn9JbkQ34W6HLx38umrHs5KT8VmdXMxdRa/poHPAMnvS0Jam0Z/u8fzyTgtfXDS+MWN3ntLxof7LsfFTKkgazfovkGbIeG36intVM3Rn5SxFVcziRVQ5+QDDA7QHwZjZELrb9qd7JH7rD6cMApk2hdTJSc9S8VM0+LtNfmZKaIgh69QIIOZkVEe+juvjni95/rGsXIjSvk+ly6dHVqyk/q+S7Xydt9mrt0j7dbG3Vn7upOczwBmb1GCr6HlqiaP/J1TpQORpXLcHcCBjWd2pRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lFqhThAU8oIrlR5DbAYaOC9ZZxMtAORl3iUm4l9ddZpPb3DW3FiYX3p+069B?=
 =?us-ascii?Q?mHrllvs3dfoCIQI0k8M494T+Bxk0VM41NxLjvAvWf0buaaGbpJQ216KbMLvF?=
 =?us-ascii?Q?cnR1mzWTsTA7CUVaw53/QiZnY3VrD1qMTRXmhPw7f2Ar3Uc53VSAdmu3pbAu?=
 =?us-ascii?Q?wb6ZXqYZXI0VBN6CT+uqHrBb4tMndy1gxXLY+vXwViTndK3DNnGmHBZiMIsx?=
 =?us-ascii?Q?gsAsWYIP5GQDnLuNBCPbkx67GrQS/YAHYqP6G9gi0YIhv4s8V8AFYQrS8Ov/?=
 =?us-ascii?Q?0B9Qmbm1ikq/jWWXidiHtQH1Ehhi1fT6b8J9qXq8Mwagq36g4sTvXCywZalJ?=
 =?us-ascii?Q?dL++fAh93m1cefbbVy6Y1CyDIWbB4jVYN5MJ1TI9/aW1skbE8PZ1mFsBCE8k?=
 =?us-ascii?Q?IaEX9bBch9dz5vh3na7VU5iNBNJbYQjmUF/3qIZkLajfl3BlPFnA2OgLaCo2?=
 =?us-ascii?Q?cX/VGMysWggN1Sj1+P9iyC6rzUa6MjIrsPYLzfZBkzOPdMrhHZooyl1aAqM7?=
 =?us-ascii?Q?/kmYAoGqueTvq1cn9SVDeahCO5mffYLi0X0pq6Sex+Yl+2DrKF6dDwi9IALQ?=
 =?us-ascii?Q?ievJkBq4N8znUcrm2oteqiN9FyEfT77aj6yE37PyGTnWqzMfoBR8Rgf47pWk?=
 =?us-ascii?Q?ZkSYjmeDRHYytyvrNSITmA3CpLL5x3vdLLbBLO05kyVFHZMQWgGLVfzsUOXX?=
 =?us-ascii?Q?9wcZLooFof+5+zTMlm26BQZ0z9blv0J4eTALqR+019G64xPC8Z8XGRzk7TQD?=
 =?us-ascii?Q?kjsPEhZ5JrKnVC7VqhcEzZVJO5XsNruOYtp8Pt5lw29Zl63zgvL7QPDPJrMC?=
 =?us-ascii?Q?CYz94DT0P/y8v0wqqEUeuDpiMjnbQoQVsNBsk+mjWkSc29jjhQ4AkSkPX/Qt?=
 =?us-ascii?Q?kXKgNSuhM42O+wS50qrATryMghUGVXpanMeySMdHorEq3R4T4lO014hvZgxE?=
 =?us-ascii?Q?QJAV5YHAfp2hreYvsiqYw3JPHvbTcGsNK7Bes/W6PoGKrDgHj/SiEfXLa5QP?=
 =?us-ascii?Q?+SFfsR4rttrDTMUUAIqMfloBfTHc10QVoow3bqoOSC7ef7ar6zWpd1RfWvop?=
 =?us-ascii?Q?mjeOo7+YPPSUnuqWCD3M1rIP/q2ggneCCwKl2MG6PrbJ8qYnC/r38M5TJ7Fe?=
 =?us-ascii?Q?1CDnr3nNshRjeGpFn6vZBZuuB2lt3jKF9Yf0VX713fzdrTW1qksARHUczO2B?=
 =?us-ascii?Q?1il1X+4Od03F4SwuFjUllHgQWZnQLJqT3VSOWWaWn+c8XUjfZJtlDDhIEbSZ?=
 =?us-ascii?Q?4hFQzPzg+SxuROlPr+F8ppC5RPL4FYWjFm/gqIFQ6ApVX3BP3qRzecDBnpIs?=
 =?us-ascii?Q?J9xsGI0sQ9AqbW4CWB8biJbmff4Cnn0qGdlERRRcUzDGExZXN+Ue3JrgJwce?=
 =?us-ascii?Q?U8QdJ5rDGHvPb8xnYvdm2MOkwfnyZrr62nA/0l5aaVar75hcqz28KQAOWEMz?=
 =?us-ascii?Q?PsM6eRkxO18KW1kX4mPt5TWqGQr4lcu3Ad322bHVFHU85i7g5efH/v1OHJJe?=
 =?us-ascii?Q?1CkLoVgI1YTU80hX/ca+4cYS7pT9+yJEIcUlsivdagpN+UM7mo26UNxK/p2n?=
 =?us-ascii?Q?HwJ9hYezDWrbJC+0FjGbkE/DKLVovrOY7/E8BPUTFVJNvUUR0vLXxr3wfr9D?=
 =?us-ascii?Q?cvOloAWz4fHmD5i4IBztGx4ePa6VOHyZeC0Z7y+SddW/AxU5MDwDVIeobmis?=
 =?us-ascii?Q?JrMEn9OjUShhAK/286NVvqq5GnOR7yjigkW5xs0dbJ+ryQiBEGb1xEfDB1CN?=
 =?us-ascii?Q?ybUhDL5K9ikrP0Quao2XFnP5Aq28tBG3cD+Wy2vLNwplVlP4hzos?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b72f2b5-863f-4af6-863b-08df1fff3838
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 21:01:53.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UKQOHKH/N0Dd3EMIc24ZIMgACt3mNIo6J2YRM9uE7sIzK2gnWUX3qdfQWC836M7qjTCg9yF3M38Ozbkx6n975rsGgrN6tprx/ww0tNlZc8b/Env6M+dFSDt7Wr22Idz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8333

On Tue, Sep 01, 2026 at 01:10:59PM +0530, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 54dca623223d..dfc4a3054b5d 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -28,6 +28,7 @@ properties:
>                - qcom,glymur-gpi-dma
>                - qcom,hawi-gpi-dma
>                - qcom,kaanapali-gpi-dma
> +              - qcom,maili-gpi-dma
>                - qcom,milos-gpi-dma
>                - qcom,qcm2290-gpi-dma
>                - qcom,qcs8300-gpi-dma
>
> ---
> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
> change-id: 20260901-maili_gpi_binding-37b12bf9e5c4
>
> Best regards,
> --
> Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>
