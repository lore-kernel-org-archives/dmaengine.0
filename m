Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5BA3CA4A8
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633172; cv=none; b=VQbn6InZEKROj2Af6r26uFySLR94te1i8AmUw1Qi/JxlNVMavjSYDPqUuGIybbDXuPt1kdWyPweIDfpHhsHDD/CAF8WK/s83nETuElpuGPMdRvuxMPtDctYqihNn5lbuiO9gVRoANLoGglFOr41oKrhvM32hc32UpW/bkWl87lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633172; c=relaxed/simple;
	bh=zHUnYuYlXzpNArtq1R7LGUDLcnO4gGX8bjpDztkAtGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ip/1yDmIClyUdnk1Xut9eXKf+8YKRUdYMDCM9Z3MBlxikjposMMZ4SpEc/JYOzTtqaLyEIpxaWrm/xbD+xYPgy032FYQNH3K1z8F7bPFx06NMleEWijViBa/cIRfzLcGQ0MT5WV0PnzgYFrRsCdjOKG6QfFqY5JKK3IZfm122fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LubtTR83; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LubtTR83"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0241F000E9;
	Tue, 21 Jul 2026 11:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784633159;
	bh=83FTGxWBsCDyYVDChbvl0TCuDlAisJAYrOoioLvBpLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LubtTR83P0e+rVj5xMNxZjm6/Dze6BqCPEh+eclkb9luXAmAnNOmmylky+Vz+zMcC
	 bltczBYlAZzFBxjLzbkVxAP+qIc6EZ1OrzsFWPSIAExCoWma2i2Yj6rkYg0RhvV+J6
	 DqCUS177EfYRre2imbzRV7zHb5gdXPPp7EtlEuB1J5SRpWpTvjQS7D1bNZWR7pmi3X
	 opdS/uE6ZMK8GHnkwMNLoLlVbA6ZD2FCyczkeCE3kd7lqAeH5nk48VfpEe3ZUapRbg
	 hrYyhAXSaOMLym+zu5Kk0h7JeyRBSvTDh1hflcmlchnRGR1tOUXHnDl86iCqs7iJIk
	 GoWqseHc/0sdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: Fix SE ID and SE Protocol
 fields widths in SCRATCH_0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chandana Kishori Chiluveru" <chandana.chiluveru@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
References: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 11:25:58 +0000
Message-Id: <20260721112559.0E0241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing write memory barrier between copying TREs to the DMA ring =
buffer and ringing the hardware doorbell.
- [High] Missing read memory barrier after reading the event ring read poin=
ter and before reading the event descriptor from DMA memory.
--

--- Patch [1]: [PATCH v2] dmaengine: qcom: gpi: Fix SE ID and SE Protocol f=
ields widths in SCRATCH_0 ---
commit 57c9b90268b2dd84de12a839b2d8897b5356eee0
Author: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>

dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields widths in SCRATCH_0

This commit fixes silently truncated serial engine indices when written into
the scratch register. It widens the GPII_n_CH_k_SCRATCH_0_SEID mask to
GENMASK(3, 0) and adjusts the GPII_n_CH_k_SCRATCH_0_PROTO mask to GENMASK(8=
, 4)
to match the documented register layout.

Link: https://patch.msgid.link/20260720-fix_se_id_and_se_protocol_fields-v1=
-1-e41dbb107d97@oss.qualcomm.com

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..fc12cf9122f9a 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -207,8 +207,8 @@ enum CNTXT_OFFS {
> =20
>  /* Scratch registers */
>  #define GPII_n_CH_k_SCRATCH_0_OFFS(n, k)	(0x20060 + (0x4000 * (n)) + (0x=
80 * (k)))
> -#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(2, 0)
> -#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(7, 4)
> +#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(3, 0)
> +#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(8, 4)
>  #define GPII_n_CH_k_SCRATCH_0_PAIR		GENMASK(20, 16)

While reviewing this driver, I noticed a couple of potential memory ordering
concerns in other parts of the file.

[Severity: High]
This is a pre-existing issue, but was not introduced by this patch. Is it
possible for the hardware to fetch uninitialized descriptors here?

In gpi_issue_pending(), the code queues descriptors via gpi_queue_xfer()
(which performs a memcpy()) and then rings the doorbell:

drivers/dma/qcom/gpi.c:gpi_issue_pending() {
    ...
	gpi_desc->db =3D ch_ring->wp;
	gpi_write_ch_db(gchan, &gchan->ch_ring, gpi_desc->db);
    ...
}

Because gpi_write_ch_db() uses writel_relaxed() without a preceding
dma_wmb(), weakly ordered architectures like ARM64 might reorder the
doorbell IO write ahead of the descriptor memory writes. Could this allow
the DMA controller to fetch stale or uninitialized descriptors from memory?


[Severity: High]
This is a pre-existing issue, but was not introduced by this patch. Can the
CPU speculatively prefetch a stale event descriptor?

In gpi_process_events(), the read pointer is fetched from the device via
readl_relaxed(), but there is no subsequent dma_rmb() before reading the
event descriptor from DMA memory:

drivers/dma/qcom/gpi.c:gpi_process_events() {
    ...
	cntxt_rp =3D gpi_read_reg(gpii, gpii->ev_ring_rp_lsb_reg);
	rp =3D to_virtual(ev_ring, cntxt_rp);

	do {
		while (rp !=3D ev_ring->rp) {
			gpi_event =3D ev_ring->rp;
			chid =3D gpi_event->xfer_compl_event.chid;
    ...
}

Since control dependencies do not enforce memory ordering on ARM64, the
memory read of gpi_event->xfer_compl_event.chid can be reordered ahead of
the register read. Could a dma_rmb() be needed after reading the RP register
to prevent processing a stale event descriptor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-fix_se_id_=
and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com?part=3D1
