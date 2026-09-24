Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE3C48AE1F
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256424; cv=pass; b=K49ve8m5kAjEAxTM5eDm/OPAgizBswfPcjHU8RxupdbQPgITZci33Z3EfsqhdaqFeV1lQBneArWmTQ/PIZ9Iam5PJFomg0KpMChTyfD8nAL46SoMDvyTIOz4WrK4mVo+KVSUuDaeJ6xjeZgsgJxTTbvMY0TTKHYfPXUdAm6rUDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256424; c=relaxed/simple;
	bh=ku6FvSAx1Adb/CWAWkt0rquSI61y5GShN/zb0Lq9yDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GB9vNMD6loCG6j2ForPKNvM6pH78Zv+g7+HUABDXW6lAIw/CQ1k6Yw6tIRP9hSf2MZHAAnl0GKksrR/Iecd6RF2gQng1THYaIV6I54cGARfQum3LaSrFt3/dY7B7qtA3u9JuLVauQ5DPI8bTya0W0VNSeFWkSAFlaYjm0FphgDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzM/VNtf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RWEW/iDN; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzM/VNtf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWEW/iDN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4Xru2285456
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 13:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t268idwIx1FkZQa+XUaUkx/NJsiQDZJ+sFLjqDOo+Og=; b=lzM/VNtfeZPyC4Af
	MZIAy8orTAZXln36oTZCXCythr6Kf5wbs1IvEcJQtuCuyRogstihDEI3aYM/l+9M
	O0gQ30vjc1+BLJ9AFMopg3C2tiEu10K5BqXPaQKeAKTp1olnyRXIjYBjaauYOBZ/
	uMkCr7S7WYAcEUcgfSKIA4G/MBmvoFXRPXKDpJr5+VD/+tcsVna4oMXGbufECfIC
	8HhcGMFq/2Hpw7qjPmF2PY/ntnnBLaa3E439eUS1qy5jH/74SnatqzJinYaeyoYH
	7hdTW/gNnmqWOqCIt8Sju38Gd08JAfSBIDbUDOyxZzr4jzKm0ZYCPD13vPsw74cr
	OVV0ZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahtwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 13:27:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd188e16a2so17261575ad.2
        for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 06:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790256419; cv=none;
        d=google.com; s=arc-20260327;
        b=FWjusFp4ntStFaaBDmnIX9ycZLyMq6BRiawPU2wdA26rn/lViX+Yvd2hFI8SynqOxs
         MK6U4b8i9MOdEqivxPxF0R/nWRVqIdN5E6B7LziHMcUmsa8OfNl4N4G8aApif34+4D52
         /N2GgMDHVg46ckFwXsg+En6u9putZIMgX8rN7mVblN9+PtcFM+Y2aWqnzPIG/0jkJJqc
         iYddl5JdHpUIj8DTD755rH3WU6Yqn49lZu4K3oyUkRu6I13MZc+5eWNaM5oT7k3AImsP
         Kvv8AitfWU5fxeEnlxlJ75e3sCLj9I+V5SaBl653sjfvUuQi9xAwOqV8gVU1NWxkNUSS
         59Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t268idwIx1FkZQa+XUaUkx/NJsiQDZJ+sFLjqDOo+Og=;
        fh=mCYe6C41Oe3Low4sCgbmZkzOt7AF8umpi6ENeZ4d0vQ=;
        b=cqpg/GMRQmB8n+MnaY7deOlS+uQDEtAlOIfPcD2rXJrTflA4elGOkvj/925TOPMg84
         6uYetfN3geBfwKhe6DkKIpgMqX4fXVhq6a/hlvG4qO32XJyEyFsqIOA4ogHbPDaWJm5Z
         YhW3ijctkYEorS4wZamM1N/LNWjIzkXUeEURvIazowqs9bof44EG9W8/5sm+cEioba5R
         H4P/ddWdABGDZDPH8TnXGEiv/7+VZmRaL5QxlWT2VuWxX2I4N323mpExz+nKpMiP9ZPu
         q6sTRPgZvNtG/v7Za6x7+rmxZL2Cn8K43UTSl3jGpaIf9yKp2YVhOQsc+n+YwxbaUEoh
         8XQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790256419; x=1790861219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t268idwIx1FkZQa+XUaUkx/NJsiQDZJ+sFLjqDOo+Og=;
        b=RWEW/iDNXSUy2ljbZ3uc8o4YwkOQke1bOE64Gr+SMalYGbD54mhUDgpu0Df5gureqq
         62h7qYCApEZsSOYyz+a6uRoHnMw1ZY5FW+BzCAA3ynCEynNfkDJ07KCN2HJpHBUQKzM6
         UULVpF+zGZM3HN4HfdWFJ8CkTAwytGZWIlp8NpGyIpfs8X7R3eZ6s1z0Qi9g+2pPxFfn
         EFbz0kQ98c8Q9ZmbxQIQV8pBoG8I61V0NaonRGc4hrULhOaPADA/JqBV2PyxAJ5Z3R2j
         EQtBAqMedBMDrM+GCBfMS7FFenLh5eHoum1gjB89GYv7eyaegE0ZC/11c1OzAeImgEWA
         tneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256419; x=1790861219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t268idwIx1FkZQa+XUaUkx/NJsiQDZJ+sFLjqDOo+Og=;
        b=AjkqXJKA7bMdT4rdlM1LR1Z8zyliffmhxqhV6kjQC1VU/nR2Ax2fIgfbtSrDaR7Hil
         6Z47r1VUfja8AwTZwOpbXgCUT5prvP9rdwqJtrgDGfWKjnOTfm2Nqld3x5OQ1pmo0DBC
         vhLriEz+9p3efSdQwxjHHCzTg7O1zqUnvarv6EDpgCnF7L5S/GjDqeFOIOgCjz6RjOuj
         kvdvUM/Urd2FQwCiEeIV22h/lbqrr/Qt3IuELPRxaM6MfmyKXalK1KPiTFJy76Yk3P/2
         /Am4IcVJEJ6/GiR+t9gk2sZaBC2hmmfEVHiz4owLWoOFhAUCCQYPxQOOxhgLc2d1Ftyx
         zIIw==
X-Forwarded-Encrypted: i=1; AKwUvBwp725ZwS17RdN5YAouT1yVUys7wdbZfShrU77i3wuFYTgVEtKL7ervh6bAJojLBpG05VJnCDE2Gc4=@vger.kernel.org
X-Gm-Message-State: AFuF++l/unuy3d4DlQt2C4lHCJLZbLfEIMkj5vitd+89iX7Sd0+pkRKx
	xPB4e2BE9UwXyVAW36AM7LusawQm28aUdMEkAod9cbBOv1X0Gx0Ug/NM+uKg00qHnx887mCJ7Mk
	DdwTWKuuoZRTx8Ew5fu6Wsd8vguUFFohj983BBKGgHr8blDQ4W6hCOhBuBg9Rl7zXrjw9y0q+Bc
	IbjqIU6QrZ5G2PAoPjozrtuX5OAY8zgx2eZM9pCA==
X-Gm-Gg: AYBFou27cSU+2UNVLTTodI6ti5FyeGnBJKyJoLbSjp6wq/j2NHSAQ2l3ivtRWly8Q6j
	Rsoku2/aGSQ8AxjJL7xWDyjZFouUrgc+03DqHdKVYjvX4OFirr0fZ8YjSCgMEdllkyotu+H6ej/
	t0J5kyf2zizTowH+dy1d1Rzh4hIHS3Jr8AangakvcfvyH0vNTikOFlNergtQ==
X-Received: by 2002:a17:902:c951:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2df7da61003mr21299715ad.2.1790256419166;
        Thu, 24 Sep 2026 06:26:59 -0700 (PDT)
X-Received: by 2002:a17:902:c951:b0:2c0:a555:80d6 with SMTP id
 d9443c01a7336-2df7da61003mr21299455ad.2.1790256418535; Thu, 24 Sep 2026
 06:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org> <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-15-9352be6b86b1@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:26:47 +0200
X-Gm-Features: AclHuK-ulLYlrDKAq5ACQMVVKj_v9czY8rajC9JIbb6FYePBBB-t1z6sdrOEP5M
Message-ID: <CAPx+jO_KJJ6ORKuw6VJmtZAOEnzVz0+bq3bEFupAK_4UROKBAA@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfX761zJ1ZKyfBc
 WuayJJ6f4NZ02nbq1SyYQqBl7kEQ/lMLHuD6vkYAzPqlCR/vIT8BB47w45dJ2LtggjCB3BgpS/N
 Uk9g20aYV4ktb5MxPVoIvhzLoe35VVo=
X-Proofpoint-ORIG-GUID: XuHhHbOTzTV4B3ef_uJNDCyUTiF_SsaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfX1BugWiUsC1/c
 g1tRL3Cqoo6RiT4dzTRWcrywaBuZZ/88jJkFf3Kf8DuNs6j+dn3U8NLokgqBkfNxN3uLpMTvhV6
 ZUlkvuaubE3ndKqFuCszkZvEG8g3ioKNWCeyclJJZ671sK1JtilwML0h8p1B4FJP1m28RKua3W9
 QliO9oYjWV/U7D3W3yaBtU5hh9FQkhxbonuUzkKI9+FtDL92BOaYmKALQojm/YSl9lcegltYoYZ
 fUMuEyXR73S8DgxFlRLNDvWpi1mtuuVRfwrapPdRdCh6Js8jBRBHhl7U90V10ViN3XbgkmKntWA
 HwvcRzbdqwChRRv1AqInZyIqXIvpsI/cL1k7dZ1a8uOPfO2JgQWAsvNSQiwEaM8ig/hJ4UJISKM
 uX+PSvO/Tb6u7hBQbxnUE5cxHUrEApMsp6Q6EUQEQlCBbeHJaDhknwE4uHOoYePMK92mqJCIinJ
 seLezLsQ8ffAmDiqI1Q==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab52524 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=kG7VYjDAWIKszkrqOz8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: XuHhHbOTzTV4B3ef_uJNDCyUTiF_SsaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240055

On Mon, Sep 21, 2026 at 12:49=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Replace the LCLA ESRAM regulator with runtime PM.
>
> Use the SRAM device that owns the ESRAM34 power domain.
>
> Hold that domain while DMA transfers are active. The DMA controller is
> runtime PM IRQ-safe, so keep taking explicit LCLA runtime PM references
> from the descriptor preparation path instead of relying on a runtime PM
> device link from the atomic transfer path.

A bit of an orthogonal problem, but related to the above. The irqsafe
thing have been discussed in the past for DMA controller drivers.

Would it possible to get rid of the irqsafe configuration for the dma
controller device, altogether?

I don't recall exactly, but not the entire consumer DMA API is allowed
to be called in atomic context, but perhaps that is not sufficient to
allow us to drop the irqsafe configuration for the DMA controller
device?

If not, I wonder if the consumer of the DMA (like an mmc controller)
should be assigned as a consumer device (using device links and
DL_FLAG_PM_RUNTIME) of the DMA controller device. In this way, the
consumer (mmc) would be able to control the supplier (DMA) through the
device link directly using runtime PM. This could potentially avoid
the requirement of having to use irqsafe for the DMA controller
device. Maybe someone already tried this?

If the irqsafe configuration can be dropped, in some way or the other,
this patch could become less intrusive, as all that would be needed is
to create a device link to sram device using DL_FLAG_PM_RUNTIME.

Kind regards
Uffe

>
> Add a stateless device link so system PM keeps the DMA controller ordered
> after the LCLA SRAM supplier.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/dma/ste_dma40.c | 130 ++++++++++++++++++++++++++++++++----------=
------
>  1 file changed, 88 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index eda3f91741ed..2841af5b160b 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -21,8 +21,8 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_dma.h>
> +#include <linux/of_platform.h>
>  #include <linux/amba/bus.h>
> -#include <linux/regulator/consumer.h>
>
>  #include "dmaengine.h"
>  #include "ste_dma40.h"
> @@ -383,6 +383,7 @@ struct d40_lli_pool {
>   * @node: List entry.
>   * @is_in_client_list: true if the client owns this descriptor.
>   * @cyclic: true if this is a cyclic job
> + * @lcla_pm_active: LCLA SRAM power domain is held for this descriptor.
>   *
>   * This descriptor is used for both logical and physical transfers.
>   */
> @@ -402,6 +403,7 @@ struct d40_desc {
>
>         bool                             is_in_client_list;
>         bool                             cyclic;
> +       bool                             lcla_pm_active;
>  };
>
>  /**
> @@ -571,7 +573,8 @@ struct d40_gen_dmac {
>   * to phy_chans entries.
>   * @plat_data: Pointer to provided platform_data which is the driver
>   * configuration.
> - * @lcpa_regulator: Pointer to hold the regulator for the esram bank for=
 lcla.
> + * @lcla_dev: SRAM device for the ESRAM bank used by LCLA.
> + * @lcla_link: Device link to keep system PM ordered against LCLA.
>   * @phy_res: Vector containing all physical channels.
>   * @lcla_pool: lcla pool settings and data.
>   * @lcpa_base: The virtual mapped address of LCPA.
> @@ -606,7 +609,8 @@ struct d40_base {
>         struct d40_chan                 **lookup_log_chans;
>         struct d40_chan                 **lookup_phy_chans;
>         struct stedma40_platform_data    *plat_data;
> -       struct regulator                 *lcpa_regulator;
> +       struct device                    *lcla_dev;
> +       struct device_link               *lcla_link;
>         /* Physical half channels */
>         struct d40_phy_res               *phy_res;
>         struct d40_lcla_pool              lcla_pool;
> @@ -628,6 +632,36 @@ static struct device *chan2dev(struct d40_chan *d40c=
)
>         return &d40c->chan.dev->device;
>  }
>
> +static void d40_transfer_runtime_get(struct d40_base *base)
> +{
> +       pm_runtime_get_sync(base->dev);
> +}
> +
> +static int d40_lcla_runtime_get(struct d40_base *base)
> +{
> +       if (!base->lcla_dev)
> +               return 0;
> +
> +       return pm_runtime_resume_and_get(base->lcla_dev);
> +}
> +
> +static void d40_desc_lcla_runtime_put(struct d40_chan *d40c,
> +                                     struct d40_desc *d40d)
> +{
> +       struct d40_base *base =3D d40c->base;
> +
> +       if (!d40d->lcla_pm_active)
> +               return;
> +
> +       d40d->lcla_pm_active =3D false;
> +       pm_runtime_put(base->lcla_dev);
> +}
> +
> +static void d40_transfer_runtime_put(struct d40_base *base)
> +{
> +       pm_runtime_put_autosuspend(base->dev);
> +}
> +
>  static bool chan_is_physical(struct d40_chan *chan)
>  {
>         return chan->log_num =3D=3D D40_PHY_CHAN;
> @@ -818,6 +852,7 @@ static void d40_desc_free(struct d40_chan *d40c, stru=
ct d40_desc *d40d)
>
>         d40_pool_lli_free(d40c, d40d);
>         d40_lcla_free_all(d40c, d40d);
> +       d40_desc_lcla_runtime_put(d40c, d40d);
>         kmem_cache_free(d40c->base->desc_slab, d40d);
>  }
>
> @@ -1516,7 +1551,7 @@ static struct d40_desc *d40_queue_start(struct d40_=
chan *d40c)
>         if (d40d !=3D NULL) {
>                 if (!d40c->busy) {
>                         d40c->busy =3D true;
> -                       pm_runtime_get_sync(d40c->base->dev);
> +                       d40_transfer_runtime_get(d40c->base);
>                 }
>
>                 /* Remove from queue */
> @@ -1535,6 +1570,7 @@ static struct d40_desc *d40_queue_start(struct d40_=
chan *d40c)
>                         d40_desc_remove(d40d);
>                         d40_desc_free(d40c, d40d);
>                         d40c->busy =3D false;
> +                       d40_transfer_runtime_put(d40c->base);
>                         return ERR_PTR(err);
>                 }
>         }
> @@ -1583,7 +1619,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
>                 if (d40_queue_start(d40c) =3D=3D NULL) {
>                         d40c->busy =3D false;
>
> -                       pm_runtime_put_autosuspend(d40c->base->dev);
> +                       d40_transfer_runtime_put(d40c->base);
>                 }
>
>                 d40_desc_remove(d40d);
> @@ -1637,6 +1673,7 @@ static void dma_tasklet(struct tasklet_struct *t)
>                 } else if (!d40d->is_in_client_list) {
>                         d40_desc_remove(d40d);
>                         d40_lcla_free_all(d40c, d40d);
> +                       d40_desc_lcla_runtime_put(d40c, d40d);
>                         list_add_tail(&d40d->node, &d40c->client);
>                         d40d->is_in_client_list =3D true;
>                 }
> @@ -2067,7 +2104,7 @@ static int d40_free_dma(struct d40_chan *d40c)
>                 d40c->base->lookup_phy_chans[phy->num] =3D NULL;
>
>         if (d40c->busy)
> -               pm_runtime_put_autosuspend(d40c->base->dev);
> +               d40_transfer_runtime_put(d40c->base);
>
>         d40c->busy =3D false;
>         d40c->phy_chan =3D NULL;
> @@ -2246,6 +2283,7 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterl=
ist *sg_src,
>         dma_addr_t dst_dev_addr;
>         struct d40_desc *desc;
>         unsigned long flags;
> +       bool got_lcla_pm =3D false;
>         int ret;
>
>         if (!chan->phy_chan) {
> @@ -2255,11 +2293,20 @@ d40_prep_sg(struct dma_chan *dchan, struct scatte=
rlist *sg_src,
>
>         d40_set_runtime_config_write(dchan, &chan->slave_config, directio=
n);
>
> +       ret =3D d40_lcla_runtime_get(chan->base);
> +       if (ret) {
> +               chan_err(chan, "Failed to enable LCLA power domain\n");
> +               return NULL;
> +       }
> +       got_lcla_pm =3D !!chan->base->lcla_dev;
> +
>         spin_lock_irqsave(&chan->lock, flags);
>
>         desc =3D d40_prep_desc(chan, sg_src, sg_len, dma_flags);
>         if (desc =3D=3D NULL)
>                 goto unlock;
> +       desc->lcla_pm_active =3D got_lcla_pm;
> +       got_lcla_pm =3D false;
>
>         if (sg_next(&sg_src[sg_len - 1]) =3D=3D sg_src)
>                 desc->cyclic =3D true;
> @@ -2297,6 +2344,8 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterl=
ist *sg_src,
>         d40_desc_free(chan, desc);
>   unlock:
>         spin_unlock_irqrestore(&chan->lock, flags);
> +       if (got_lcla_pm)
> +               pm_runtime_put(chan->base->lcla_dev);
>         return NULL;
>  }
>
> @@ -2628,7 +2677,7 @@ static int d40_terminate_all(struct dma_chan *chan)
>         d40_term_all(d40c);
>         pm_runtime_put_autosuspend(d40c->base->dev);
>         if (d40c->busy)
> -               pm_runtime_put_autosuspend(d40c->base->dev);
> +               d40_transfer_runtime_put(d40c->base);
>         d40c->busy =3D false;
>
>         spin_unlock_irqrestore(&d40c->lock, flags);
> @@ -2931,29 +2980,11 @@ static int __init d40_dmaengine_init(struct d40_b=
ase *base,
>  #ifdef CONFIG_PM_SLEEP
>  static int dma40_suspend(struct device *dev)
>  {
> -       struct d40_base *base =3D dev_get_drvdata(dev);
> -       int ret;
> -
> -       ret =3D pm_runtime_force_suspend(dev);
> -       if (ret)
> -               return ret;
> -
> -       if (base->lcpa_regulator)
> -               ret =3D regulator_disable(base->lcpa_regulator);
> -       return ret;
> +       return pm_runtime_force_suspend(dev);
>  }
>
>  static int dma40_resume(struct device *dev)
>  {
> -       struct d40_base *base =3D dev_get_drvdata(dev);
> -       int ret =3D 0;
> -
> -       if (base->lcpa_regulator) {
> -               ret =3D regulator_enable(base->lcpa_regulator);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         return pm_runtime_force_resume(dev);
>  }
>  #endif
> @@ -3509,7 +3540,10 @@ static int __init d40_probe(struct platform_device=
 *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct device_node *np =3D pdev->dev.of_node;
>         struct device_node *np_lcpa;
> +       struct device_node *np_lcla;
> +       struct device_node *np_lcla_parent;
>         struct d40_base *base;
> +       struct platform_device *lcla_pdev;
>         struct resource *res;
>         struct resource res_lcpa;
>         int num_reserved_chans;
> @@ -3610,21 +3644,32 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
>         irq_requested =3D true;
>
>         if (base->plat_data->use_esram_lcla) {
> +               np_lcla =3D of_parse_phandle(np, "sram", 1);
> +               if (!np_lcla) {
> +                       dev_err(dev, "no LCLA SRAM node\n");
> +                       ret =3D -EINVAL;
> +                       goto destroy_cache;
> +               }
>
> -               base->lcpa_regulator =3D regulator_get(base->dev, "lcla_e=
sram");
> -               if (IS_ERR(base->lcpa_regulator)) {
> -                       d40_err(dev, "Failed to get lcpa_regulator\n");
> -                       ret =3D PTR_ERR(base->lcpa_regulator);
> -                       base->lcpa_regulator =3D NULL;
> +               np_lcla_parent =3D of_get_parent(np_lcla);
> +               of_node_put(np_lcla);
> +               if (!np_lcla_parent) {
> +                       dev_err(dev, "no LCLA SRAM parent node\n");
> +                       ret =3D -EINVAL;
>                         goto destroy_cache;
>                 }
>
> -               ret =3D regulator_enable(base->lcpa_regulator);
> -               if (ret) {
> -                       d40_err(dev,
> -                               "Failed to enable lcpa_regulator\n");
> -                       regulator_put(base->lcpa_regulator);
> -                       base->lcpa_regulator =3D NULL;
> +               lcla_pdev =3D of_find_device_by_node(np_lcla_parent);
> +               of_node_put(np_lcla_parent);
> +               if (!lcla_pdev) {
> +                       ret =3D -EPROBE_DEFER;
> +                       goto destroy_cache;
> +               }
> +               base->lcla_dev =3D &lcla_pdev->dev;
> +               base->lcla_link =3D device_link_add(dev, base->lcla_dev,
> +                                                 DL_FLAG_STATELESS);
> +               if (!base->lcla_link) {
> +                       ret =3D -ENODEV;
>                         goto destroy_cache;
>                 }
>         }
> @@ -3663,16 +3708,17 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
>                                  SZ_1K * base->num_phy_chans,
>                                  DMA_TO_DEVICE);
>
> -       if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
> +       if (!base->lcla_pool.base_unaligned && base->lcla_pool.base &&
> +           base->lcla_pool.pages)
>                 free_pages((unsigned long)base->lcla_pool.base,
>                            base->lcla_pool.pages);
>
>         kfree(base->lcla_pool.base_unaligned);
>
> -       if (base->lcpa_regulator) {
> -               regulator_disable(base->lcpa_regulator);
> -               regulator_put(base->lcpa_regulator);
> -       }
> +       if (base->lcla_link)
> +               device_link_del(base->lcla_link);
> +       if (base->lcla_dev)
> +               put_device(base->lcla_dev);
>         if (irq_requested)
>                 free_irq(base->irq, base);
>         if (runtime_pm_enabled)
>
> --
> 2.55.0
>
