Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906348;
	b=VyMc7wza9SxkSk24hrF1MJOwKKs2oOa60L2lOLEh4IilHsVIbUOONEbknDhXaZvgUQ1T
	 9HKmSVC8783M9LKkrVBn3zojl43SS+yvYPQk08jKVHHDrGz0mxEK3M5pMU6mlLoXHIOQi
	 gW5vsrK1K/tS2fd/wxoNXqhYvu9PgOlo1ubDKEzZ/VNUIIbGlJXLNAql9dv4hek4PqWJL
	 +Ot+GJHrocRAe//PumS6sS1Q3iJuBWZ5LeVryyCLhnxPHUSp1YidLLFs+q4VcXOh8o4Lb
	 wAM3/4yA1Me4JfYdYAhiTp1NubW1kLG06+XVbhx+13QkZAJ2AEj9ldjp0odjk12m+dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906348;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Mailer:From:To:Cc:
	 Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:
	 Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=4KTLjFOLB3Bw3rwGT8qot1q76+iLWn9KmQr9KnByOio=;
	b=dNzbKIeSx7891+5XPmNzlfXDICa6oDAckulvgvlzq9j/7VBfNqxVHViXVxe9PwRMCroS
	 7P3X3BBW6oIseRQdSP4SWWGiHun0alZd7uE9lV65hNbNCw2u7OQGo1284tNMR5HjyaNGX
	 niEzKbc102dAFu4IcaWwbqXD8OFO8YlcdFhy4PFzLmnVsxyHRsPhBNUzMy3Uf+O6LDsTJ
	 2/sp8snnkM5R8vBlA4AkeX6qrGGei+fSELfMmTod1gO4LghrJ4uVf2lRDhEtw05WgzNkB
	 zgK45t6LBE72Q/Pxg1FogNl+hPptJAfJ1fwB2Ds95h3IhVhBJCNmcqF9s4N/FOJy+lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=0LMjIwBb;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=YDzFYP+z;
	arc=none smtp.remote-ip=23.251.234.50
Received: from e234-50.smtp-out.ap-northeast-1.amazonses.com (e234-50.smtp-out.ap-northeast-1.amazonses.com [23.251.234.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37698606D803;
	Thu,  5 Nov 2026 19:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37698606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=0LMjIwBb;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=YDzFYP+z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1793906345;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=KjK6/it5+2sDEN6+68hm612BuS7rPhjf+Cw6EfwhY+Y=;
	b=0LMjIwBbEXV9VRucSky8VB+NQdqv31r1REne19ATooStdbHX+56adyHFlDWtVxEj
	FkK2gF4I/NiBi+29b8MfLpGmqFlkldRnKu2jZhGI4uY3d9XQmyge4rIwMFFH17bQbGR
	m/Y45ysn0SydDhUKljfPni284lTo41RsMWM9cmnc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1793906345;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=KjK6/it5+2sDEN6+68hm612BuS7rPhjf+Cw6EfwhY+Y=;
	b=YDzFYP+zC6Rxrtg6NwWfbj7rC1WKjAyMGY64NSErEQFfQHijuFvqPEUN9xRHxtyj
	REq2FY6i8QIzuUIiUYtdKTMRGOQnjv9MDPl8ztGSiFCKlSf49gz0Yll+AStUY3lorAA
	wjSAXMgFmJU1vQhiJp1ANGl9n8rgmc461kWooOZU=
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] dmaengine: qcom: gpi: match control interrupts to the
 pending command
Message-ID: <010601a1ad2686dd-235641c9-2f2e-49d3-9ef9-3070b49614ce-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Nov 2026 19:19:05 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.05-23.251.234.50

Each GPI instance shares one command completion between its two transfer
channels and event ring. Both control interrupt handlers complete that
object regardless of which target the pending command addresses. A
control interrupt for the other channel or event ring can therefore end
the wait early. During channel deallocation, it also applies the synthetic
not-allocated state to every channel reported in the interrupt status.

Record the pending command and target under pm_lock before writing the
command register. Only complete a pending command for the matching target,
and restrict the deallocation state override to that target. Clear the
pending flag after the wait, including on timeout. Preserve updates of
hardware state and the STOP_IN_PROC transition handling for all channels.

The existing ctrl_lock serializes command issuers. This change matches
the interrupt target, not individual command generations: it does not
attempt to distinguish late completions for successive commands to the
same target after a timeout.

Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
This is independent of the downstream QSPI controller changes used on
my Surface Laptop 7. A version of the target-matching logic is in that
working kernel, but I have not reproduced the delayed-control-IRQ race
on an otherwise upstream kernel.

The patch applies to dmaengine next at =
6628e7d4c6b. An ARM64 W=3D1 module
build passes against my prepared kernel =
build. An ASan/UBSan harness using
the actual send and interrupt functions =
passes 3,206 command/IRQ cases,
including mismatched channel/event =
notifications, STOP_IN_PROC, timeout
and pending-state cleanup. The =
unmodified driver fails that harness.

base-commit: =
ee9c669f9bf5fd2c24206746ded9382fe810df89

 drivers/dma/qcom/gpi.c | 23 =
++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273..9479adf55d 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -514,6 +514,8 @@ struct gpii {
 	struct tasklet_struct ev_task; /* event processing tasklet */
 	struct completion cmd_completion;
 	enum gpi_cmd gpi_cmd;
+	u32 cmd_chid;
+	bool cmd_pending;
 	u32 cntxt_type_irq_msk;
 	bool ieob_set;
 };
@@ -684,16 +686,23 @@ static int gpi_send_cmd(struct gpii *gpii, struct =
gchan *gchan,
 	dev_dbg(gpii->gpi_dev->dev,
 		"sending cmd: %s:%u\n", =
TO_GPI_CMD_STR(gpi_cmd), chid);
=20
-	/* send opcode and wait for =
completion */
+	/* Publish the command and its target atomically with =
respect to IRQs. */
+	write_lock_irq(&gpii->pm_lock);
 	reinit_completion(&gpii->cmd_completion);
 	gpii->gpi_cmd =3D gpi_cmd;
+	gpii->cmd_chid =3D chid;
+	gpii->cmd_pending =3D true;
=20
 	cmd_reg =3D IS_CHAN_CMD(gpi_cmd) ? gchan->ch_cmd_reg : gpii->ev_cmd_reg;
 	cmd =3D IS_CHAN_CMD(gpi_cmd) ? GPII_n_CH_CMD(gpi_cmd_info[gpi_cmd].opcode=
, chid) :
 				     GPII_n_EV_CMD(gpi_cmd_info[gpi_cmd].opcode, 0);
 	gpi_write_reg(gpii, cmd_reg, cmd);
+	write_unlock_irq(&gpii->pm_lock);
 	timeout =3D wait_for_completion_timeout(&gpii->cmd_completion,
 					      msecs_to_jiffies(CMD_TIMEOUT_MS));
+	write_lock_irq(&gpii->pm_l=
ock);
+	gpii->cmd_pending =3D false;
+	write_unlock_irq(&gpii->pm_lock);
 	if (!timeout) {
 		dev_err(gpii->gpi_dev->dev, "cmd: %s completion =
timeout:%u\n",
 			TO_GPI_CMD_STR(gpi_cmd), chid);
@@ -770,7 +779,8 @@ =
static void gpi_process_ch_ctrl_irq(struct gpii *gpii)
 		 * not change hardware status. So overwriting software state
 		 * to default state.
 		 */
-		if (gpii->gpi_cmd =3D=3D =
GPI_CH_CMD_DE_ALLOC)
+		if (gpii->cmd_pending && gpii->cmd_chid =3D=3D chid=
 &&
+		    gpii->gpi_cmd =3D=3D GPI_CH_CMD_DE_ALLOC)
 			state =3D DEFAULT_CH_STATE;
 		gchan->ch_state =3D state;
=20
@@ -779,7 +789,9 @@ static void gpi_process_ch_ctrl_irq(struct gpii *gpii)
 		 * Stop in process is a transition state and we will wait for
 		 * stop interrupt before notifying.
 		 */
-		if (gchan->ch_state !=3D =
CH_STATE_STOP_IN_PROC)
+		if (gpii->cmd_pending && IS_CHAN_CMD(gpii->gpi_cm=
d) &&
+		    gpii->cmd_chid =3D=3D chid &&
+		    gchan->ch_state !=3D =
CH_STATE_STOP_IN_PROC)
 			complete_all(&gpii->cmd_completion);
 	}
 }
@@ -877,13 +889,14 @@ static irqreturn_t gpi_handle_irq(int irq, void =
*data)
 			 * cmd does not change hardware status. So overwriting
 			 * software state to default state.
 			 */
-			if (gpii->gpi_cmd =
=3D=3D GPI_EV_CMD_DEALLOC)
+			if (gpii->cmd_pending && gpii->gpi_cmd =
=3D=3D GPI_EV_CMD_DEALLOC)
 				ev_state =3D DEFAULT_EV_CH_STATE;
=20
 			gpii->ev_state =3D ev_state;
 			dev_dbg(gpii->gpi_dev->dev, "setting =
EV state to %s\n",
 				TO_GPI_EV_STATE_STR(gpii->ev_state));
-			complete_all(&gpii->cmd_completion);
+			if (gpii->cmd_pending && !=
IS_CHAN_CMD(gpii->gpi_cmd))
+				complete_all(&gpii->cmd_completion);
 			type &=3D ~(GPII_n_CNTXT_TYPE_IRQ_MSK_EV_CTRL);
 		}
=20
--=20
2.53.0

