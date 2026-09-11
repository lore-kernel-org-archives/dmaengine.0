Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4F476046
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 12:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130025; cv=none; b=IxGUl5ddRCxnHO3KQPR/hltr/yy5ZpvICQrl/9aQWyjRZiaXo2WnuocSo8oLflQ3LHrMj1he0TXmwom9TO440Cd2+Jayn/dI6+W6Tf4tvUy64VzISRQOgGRomsGdjJw1jzeuUaJqm9SGdvYraQoSJQik0qNIChsPSwuFYtr01M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130025; c=relaxed/simple;
	bh=W1BT5wLV5UACWU59maDhG8w3WFFvnU7ZUpjM8vM/QNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=REpKtGvaWahd1yT7CVK6LtMr5KSprW4z5QK/xVvokG7fN7UBcFmnYvTnDTB0oZ+Jq3WMTqAUUkV7R/xiOrnBF6qi9Z3wCl3aNt76P5yUG6fBOmd6FNhHsQm5BGtTpVXbdJFm3ViSHQm3SB22S/VDzgXDC8H7drsbwBdajAaWETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=16DnCVCF; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="16DnCVCF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0432AC653FF;
	Fri, 11 Sep 2026 12:34:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2033E601DE;
	Fri, 11 Sep 2026 12:33:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57C8411C7AFA8;
	Fri, 11 Sep 2026 14:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789130016; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8yy5zNv8/frc4Fc0jGFJfjDkAWKZuVZtLGLeGk49jBk=;
	b=16DnCVCFtBW4gV4TVQQqvP3Gq9ICfkIWVX2W2DYsCVeoO8ZjC2tB2M4dafoGRugsfLX2vQ
	1x+z4BL9WCTbq6cQdh2WuXmVb9yYUzrE53EkDSttVlzKJ3lvPe99LoaEHwmPqgAbnbfvRt
	qe8wcu/jvdGnELCeWC3B9F6OTLUgccQmmwGKyU1FJ+mPCzs2fInaUrOyrZMnmr4DuCJ0fv
	Hw+tqRJdLVX7KMyUqRylTS67R4AxKA9sW4/5mSEo09F4noJRAx0M7YG/Rm1Z2TBV8c3/nN
	4Kekxa+nXPvtIc9n8Tkbyp+Zeq9E0B9oVGbYZEGG+9XLjWlXyQd1/Bnjk17H5w==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v9 2/2] dmaengine: fsl-edma: Support dynamic scatter/gather
 chaining
Date: Fri, 11 Sep 2026 14:33:34 +0200
Message-ID: <oBv7yd-8ShCSaD2GFjIzIg@bootlin.com>
In-Reply-To: <aqMqaaDRKHzZObJE@lizhi-Precision-Tower-5810>
References:
 <20260909-fsl-edma-dyn-sg-v9-0-60bb2e678e8f@bootlin.com>
 <20260909-fsl-edma-dyn-sg-v9-2-60bb2e678e8f@bootlin.com>
 <aqMqaaDRKHzZObJE@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Friday, 11 September 2026 at 00:08:41 CEST, Frank Li wrote:
> > +      /* Link the SG descriptors with the available identifiers */
> > +      list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_submi=
tted, node) {
> > +              if (++issued_count > FIELD_MAX(EDMA_TCD_CSR_LINKCH))
> > +                      break;
> > +              fsl_edma_link_sg(fsl_chan, to_fsl_edma_desc(vdesc));
> > +              list_move_tail(&vdesc->node, &fsl_chan->vchan.desc_issue=
d);
>=20
> If this happen, it will depend on DONE irq to queue left desc_issued to
> hardware tcd? So there are idle gap?
>=20
> I think it is fine, less possible longer than 31. I just want to confirm
> if my understand is correct.
>=20
Yes, only 31 descriptors get linked at most, to make sure that we never get
the same link_sg_id twice in the issued queue. So we always know which
descriptor to handle in the end of transfer interrupt.

If we have more descriptors, their last TCD keep the D_REQ flag, and they
are handled one by one as we are doing today with a "stop-and-start" of the
channel.

[...]
> > +#define FSL_EDMA_DRV_EDMA3    (FSL_EDMA_DRV_SPLIT_REG |               \
> > +                               FSL_EDMA_DRV_BUS_8BYTE |               \
> > +                               FSL_EDMA_DRV_DEV_TO_DEV |              \
> > +                               FSL_EDMA_DRV_ALIGN_64BYTE |            \
> > +                               FSL_EDMA_DRV_CLEAR_DONE_E_SG |         \
> > +                               FSL_EDMA_DRV_CLEAR_DONE_E_LINK |       \
> > +                               FSL_EDMA_DRV_CSR_LINKCH)
> >
> > -#define FSL_EDMA_DRV_EDMA3    (FSL_EDMA_DRV_SPLIT_REG |       \
> > -                               FSL_EDMA_DRV_BUS_8BYTE |       \
> > -                               FSL_EDMA_DRV_DEV_TO_DEV |      \
> > -                               FSL_EDMA_DRV_ALIGN_64BYTE |    \
> > -                               FSL_EDMA_DRV_CLEAR_DONE_E_SG | \
> > -                               FSL_EDMA_DRV_CLEAR_DONE_E_LINK)
> > -
> > -#define FSL_EDMA_DRV_EDMA4    (FSL_EDMA_DRV_SPLIT_REG |       \
> > -                               FSL_EDMA_DRV_BUS_8BYTE |       \
> > -                               FSL_EDMA_DRV_DEV_TO_DEV |      \
> > -                               FSL_EDMA_DRV_ALIGN_64BYTE |    \
> > -                               FSL_EDMA_DRV_CLEAR_DONE_E_LINK)
> > +#define FSL_EDMA_DRV_EDMA4    (FSL_EDMA_DRV_SPLIT_REG |               \
> > +                               FSL_EDMA_DRV_BUS_8BYTE |               \
> > +                               FSL_EDMA_DRV_DEV_TO_DEV |              \
> > +                               FSL_EDMA_DRV_ALIGN_64BYTE |            \
> > +                               FSL_EDMA_DRV_CLEAR_DONE_E_LINK |       \
> > +                               FSL_EDMA_DRV_CSR_LINKCH)
>=20
> Can you avoid move \ in this patch to reduce difference.
>=20
Ok, I will revert that change and resend.

Best regards,
=2D-=20
Beno=C3=AEt


