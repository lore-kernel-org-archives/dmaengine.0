Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE7F432E67
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562354; cv=none; b=UXflvWX0OVDV4pnWNaZuCZTOlwyk2cO/5LkldO5tsD6XTB7OL3N/8A9FCL7V6qLpGnLyuOwRs42cBZKhNCMV0Xm1PRCO4T3/BWNNXZ9YDuz8IbWq/FAXPXPLG0K78+3Tp/jEENOmn9DEWJBurZp0piLhoSIk6yTwdQgwSE+X8Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562354; c=relaxed/simple;
	bh=QW89kWoy6Hu4ntxY74AC1J3Y0EjqWamSOTQCA/X/OvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q/NyL3HTgCjMKbQIEQvJG3iZnRqPot1cpWngY7OixC9GiKZ6/9+E3celhszXifNnX1My8Fzusi+/HS0MsnGkV4U6bZ+9sW1OWlpkwO/byLn0CC2Kuu6MZXs/O4SkM590WTzrNyxCbxjoQwhTFQmUhPPE7Hz+4zTzWJQqp1D6Ep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRSD/Rtf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRSD/Rtf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2857B1F00A3A;
	Mon, 20 Jul 2026 15:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784562351;
	bh=1ANScl6TMXU0Ik6OMlf3yn1QdnBgQvX5LoMTHIqH9kM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BRSD/RtfBowFiU1FA813Z9S/q3EjrzbP9vOc/aEvVapDrdpCoNE2DsfMEMzLnVM7w
	 +bGxgxA+46roQbaGFeTHHUXmteDo+ENYIvpCshG3MDEQ2UBx9Los6cVHGsHpCjw1Qv
	 OCEps0TS2zqobO6thnA6jQ82sCdMZqve8HfIRQR+2NtrWhz6+Ul64JkBNKnRJ+JFMP
	 5z8tk4Ng5RTHhRlEJmK+ZGWYTcpcS2waEpTikeipFYuK+ayTUymkmeCwJTYEKJmqkn
	 cGOtnU70vzHpDOEY+G+JFukCVMpsy47WEZRgRjE90AnbkLd4PgSo/DKtdGFOXLFyhI
	 2chHzG1e1k1MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chandana Kishori Chiluveru" <chandana.chiluveru@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com>
References: <20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 15:45:50 +0000
Message-Id: <20260720154551.2857B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Error cleanup paths in gpi_ch_init() incorrectly reset the wrong c=
hannel.
- [High] Missing dma_wmb() before ringing the hardware doorbell in `gpi_iss=
ue_pending()`, which may cause the DMA engine to read stale descriptor memo=
ry.
- [High] Missing dma_rmb() in `gpi_process_events()` after observing the ha=
rdware read pointer, risking speculative reads of stale event data.
- [High] Flawed virt-dma descriptor submission logic in `gpi_issue_pending(=
)` causes descriptors to be silently skipped.
--

--- Patch [1]: [PATCH] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fiel=
ds widths in SCRATCH_0 ---
commit cf1da458f619102482edf1e06ebdff45f28db2b5
Author: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>

dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields widths in SCRATCH_0

This commit corrects the widths of the SE ID and SE Protocol fields in the
SCRATCH_0 register definition for the GPI DMA driver. It updates the SE ID
field to 4 bits to match newer QUP hardware documentation and avoid silently
truncating serial engine indices. The SE Protocol field is also updated to
keep both fields correctly packed.

> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af6..8f09eaf4e714c 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c

[ ... ]

While reviewing this patch, I noticed a few pre-existing issues in
drivers/dma/qcom/gpi.c:

drivers/dma/qcom/gpi.c:gpi_ch_init() {
    ...
	error_start_chan:
		for (i =3D i - 1; i >=3D 0; i--) {
			gpi_stop_chan(&gpii->gchan[i]);
			gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
		}
		i =3D 2;
	error_alloc_chan:
		for (i =3D i - 1; i >=3D 0; i--)
			gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
    ...
}

[Severity: High]
This is a pre-existing issue, but does this cleanup path reset the correct
channel?

If gpi_start_chan() fails during initialization, the error handler iterates
backward to stop and reset the previously initialized channels. However,
instead of passing the iterated channel &gpii->gchan[i] to gpi_send_cmd()
and gpi_reset_chan(), it passes the function argument gchan.

Could this leave the actual channel that needs to be rolled back active
and partially allocated, while repeatedly resetting the argument channel?
This might lead to channel state corruption and resource leaks.

drivers/dma/qcom/gpi.c:gpi_issue_pending() {
    ...
	gpi_desc =3D to_gpi_desc(vd);
	for (i =3D 0; i < gpi_desc->num_tre; i++) {
		tre =3D &gpi_desc->tre[i];
		gpi_queue_xfer(gpii, gchan, tre, &wp);
	}

	gpi_desc->db =3D ch_ring->wp;
	gpi_write_ch_db(gchan, &gchan->ch_ring, gpi_desc->db);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but is a memory barrier required
before ringing the hardware doorbell?

gpi_issue_pending() writes Transfer Ring Elements to DMA ring buffer
memory via gpi_queue_xfer(), which uses memcpy(). It then immediately rings
the hardware doorbell via gpi_write_ch_db(), which maps to writel_relaxed().

Because writel_relaxed() does not guarantee memory write visibility before
the I/O write, and there is no memory barrier between the descriptor writes
and the doorbell write, is it possible for the DMA hardware to observe the
doorbell write and fetch the elements before the CPU's memory writes have
reached RAM?

Could this result in the DMA processing stale or zeroed memory?

drivers/dma/qcom/gpi.c:gpi_process_events() {
    ...
	cntxt_rp =3D gpi_read_reg(gpii, gpii->ev_ring_rp_lsb_reg);
	rp =3D to_virtual(ev_ring, cntxt_rp);

	do {
		while (rp !=3D ev_ring->rp) {
			gpi_event =3D ev_ring->rp;
    ...
}

[Severity: High]
This is a pre-existing issue, but is a read memory barrier needed after
reading the hardware pointer?

gpi_process_events() reads the hardware event ring read pointer using
gpi_read_reg(), which uses readl_relaxed(). It then immediately enters a
loop that dereferences memory from the event ring.

Because readl_relaxed() does not contain an implicit memory barrier, is the
CPU permitted to speculatively prefetch the event ring memory before the
read of the hardware pointer register completes?

Could this result in the driver processing stale event data that hasn't yet
been updated by the DMA hardware?

drivers/dma/qcom/gpi.c:gpi_issue_pending() {
    ...
	/* move all submitted descriptors to issued list */
	spin_lock_irqsave(&gchan->vc.lock, flags);
	if (vchan_issue_pending(&gchan->vc))
		vd =3D list_last_entry(&gchan->vc.desc_issued,
				     struct virt_dma_desc, node);
	spin_unlock_irqrestore(&gchan->vc.lock, flags);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this logic successfully
handle multiple submitted descriptors?

vchan_issue_pending() moves all newly submitted descriptors from the
desc_submitted to the desc_issued list. gpi_issue_pending() then retrieves
only a single descriptor using list_last_entry(), and queues only this last
descriptor's elements to the hardware ring.

If a client submits multiple descriptors before issue_pending() is called,
would the earlier descriptors be silently ignored? Furthermore, when the la=
st
descriptor completes, gpi_process_xfer_compl_event() uses vchan_next_desc()
which retrieves the first descriptor.

Could this mismatch lead to incorrect DMA completion notifications?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-fix_se_id_=
and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com?part=3D1
