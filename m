Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795520732;
	b=l9hv2OrzYcAzp4J2JqeEadZdlTrowpyICT0Xp8f528Wz5rwh6VtSMaVuOfNvveyEVu2O
	 rxK+B5xAiF0/B9COX6YjKq1vTLKQ0NSjLszla6uZByi8tkJILjSa6KL12F32VfP9s/2BM
	 dCjwy1BfXuj6e6jDehRMIc4JFcVYJaYXZiaEOWkyX0WQOnEyrJ/+axw+o7KDBQZ/G9rgo
	 M8Osx7lxaL1QAirH50AiPLJ7srxNuarKcUxQwaLFLhH7qLy89P03pyExp5pJAYk55LSux
	 AtPkyKppXZuPoPRpPIxF3rK3QqFs8xaW/ukAuQBhAkiEjnRO0vDUQ9boJeg+MWwCBvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520732;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=V+4F6I7uCMsa56sY8qxl3MrFvsZqFdQNXxT4S0Y1kkE=;
	b=4lGZGY4PAppA8tMHieedNZLUhjFaLsDm+dfUwBXopiSaemKEJvtBIIvA5MVBlSA+uDnU
	 ELRHuWcQwMiiJZPE5sJFC3zRzsjWWf6aWWnEZHeaT/xAQKtatq8d50i8skojJN2AMqT1D
	 9oG3cDv0s2z10uXzQikpROQiB0pi+RV6YqUxDIQeCi+At1EV2TQLlE3lj2+e8P21G0FNM
	 /hOdVVJpDMjf8S9YBikSALfMLm74/EiI6YIovM9mzIVZCCwmENbyHZakxTJcLTgtrOgNT
	 gI+iG8thBC/mPYhBtsoQe9EKpUkdNC34fL/B6nRB9ca3l1d97Yg9BGJl4rkmBhnFrYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHqkHaCR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC7606A32A;
	Tue, 24 Nov 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VHqkHaCR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795520731;
	b=C+jFIU8X9PNNhjltL0ZCA9cpvqRvZ4ph1MajS+tNo442V6mTJKLhIlRsNoGB6Z7NJGjP
	 AhvXyFC4T5Ay8vdt1QZDnoCCAf6wMV280AwpxzF/OlAP3WMl4mKKM0r1ruAoMinR0nt+B
	 N4K/tHJq3pTK1Bl/wO2VjKoa7hF3cWL3l/CKA1Uij/0MTLCtPBycejTXHn2rmCw1p3BJF
	 PwLXIR0/ermGQF/2AJF+epSaZg9EJQrU1L7Oz+zbufap5CAdv1qWIXeSsYRzc/vkNkTQB
	 DCg6qAHOYI4WlkToUcEYOjNx9hK6faLOgxQY5losYIXRWgqFPyCngJ2SkXtnYuCGrPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520731;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=V+4F6I7uCMsa56sY8qxl3MrFvsZqFdQNXxT4S0Y1kkE=;
	b=ESojCyUJZYwyGgD3qdaDaoTFA1WFCeEHEBKN9QGKUiYuHGCwex9TnLKy5jNoAd8IVsVa
	 ulMOdZv0GbUZOAaitsWNyvdfwqBtJ+kNrh8xtExLPgFh3h2WI6VoI/dnA/6YFAxlsVIYS
	 CkjXDUT1d8bnG8j8E0SmZ7pU1kkk4JnsbkfB6sUDLB8b6Vu+2zRprzG/eXvuXyzIfUETY
	 dFiWjszA48VZtwgzhSKbyjXBbrxKymhXwvVSDhsq3C9DkdtDujv+Ni8rgxzVxc5TfPDyk
	 K6GU3SmYYU/ZQz4xp+ic9VhDz2e/Ukc3iNRfYYppAJhNVifPasAe4OoGOccWBV6eC3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C7741F000D0;
	Tue, 24 Nov 2026 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520731;
	bh=V+4F6I7uCMsa56sY8qxl3MrFvsZqFdQNXxT4S0Y1kkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VHqkHaCRz3S0EON7z9scfxhtaAz5gPNZ7pYtBLwuSeogN6V9WHpYpLc/7ETrf/U72
	 dKOFSjN7dZDMixTA1efJVvKaoJ8bsAcyv5Mn2dVNPKowwdbl0xrAZWKPlL5RM84ojZ
	 zAZxa7gnGbpZWNunxWECVHxbU57AKe/KYpd6zgXQ1SAYzyUi6ikqkivGgqGh73OoSP
	 lj1fAz63OmvqCpMjwWTegmErABkC79itJQopvXJ7l9PWc0DMM6bZZPt2GZeBMyhuXF
	 KlEnMor+mNjbfPjs2lX3BMwcWwjBVCoUp+ZJEdlTCCli+nSHnpuXr5i/vNaPV6Vg0o
	 XE7oRzS+Fe3MA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E4E414C9B1;
	Tue, 24 Nov 2026 11:45:26 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 17:15:03 +0530
Subject: [PATCH v13 01/20] dmaengine: ti: k3-udma: Fix sporadic crash on
 AM62x
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dma-upstream-v13-v13-1-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
In-Reply-To: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 sebin.francis@ti.com, Sai Sree Kartheek Adivi <s-adivi@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795520723; l=2302;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=0QbFZNXvvMb+ue0ziAGKkg7DBgtCKZ+KVB36CbCIP+g=;
 b=MRewRL5HmtOr8dMHDtNNoJPPgWV02lzo2xXfLL/qI8dUiJyKIOfFBiHACm9/3gPEyXhCNTLlm
 ZN6RO5wDQ1CBKlWU1ak3bBEsCgPHEAKHEZuEqw0OTwXvAjJqtCbOeIS
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reply-To: s-adivi@ti.com

From: Vignesh Raghavendra <vigneshr@ti.com>

ring_init_data is declared on stack and left uninitialized, so any
field not explicitly assigned afterwards carries garbage. Every field
that exists on struct k3_ringacc_init_data today (tisci, tisci_dev_id,
num_rings) is set immediately below, so this is currently a no-op, but
a later patch in this series adds a base_rt field to the same struct
that is not set by this call site. Without this fix, that field would
carry stack garbage here, and k3_ringacc_dmarings_init() could use a
junk address for the ringrt base, causing a crash during ring pop:

[    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
[    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
[    2.540051] Mem abort info:
[...]
[    2.629987] Workqueue: events_unbound deferred_probe_work_func
[    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
[    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
[...]
[    2.726250] Call trace:
[    2.728691]  k3_ringacc_ring_pop+0x48/0x94
[    2.732786]  udma_ring_irq_handler+0x34/0x218
[    2.737141]  __handle_irq_event_percpu+0x60/0x14c
[    2.741846]  handle_irq_event+0x4c/0xa8

Fix this proactively by explicitly initializing the variable to 0,
before the base_rt field is introduced.

Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 75bd1977fb423..6f3f0467fd5e0 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -5467,7 +5467,7 @@ static int udma_probe(struct platform_device *pdev)
 	if (ud->match_data->type == DMA_TYPE_UDMA) {
 		ud->ringacc = of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc");
 	} else {
-		struct k3_ringacc_init_data ring_init_data;
+		struct k3_ringacc_init_data ring_init_data = { 0 };
 
 		ring_init_data.tisci = ud->tisci_rm.tisci;
 		ring_init_data.tisci_dev_id = ud->tisci_rm.tisci_dev_id;

-- 
2.55.0


