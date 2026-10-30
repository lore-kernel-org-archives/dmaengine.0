Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372370;
	b=TlAXgnLI/c0P/JmTrqNTJVoxaB8aIMTW7NGNqF4kkWeQzgb4xIDAy2UFEs/SOaAf/0EN
	 5te3QjH/bROa0gx0SFceVoFxPeGR9SutQFpXpQHgD/4BMJtp1mGwX5S4ILpx3IgCrc2Ej
	 KqM/ic+++oMPbP/eq6Dc9i86DNNvPXOohrdXLW9q7QynovJ1iZmkh3tZ2eTmOBqDXiP+e
	 BndbNxvEtyMM+6hk+xMgWrXBd6k2NlziCmN9x81TDiUKawfFJlqL3TMU8Rt8nxWJbNRN9
	 kBiN9xIpgh/qmG4dV5M1Sdxci0zYA0VQmpRS4MN7yhifxYM4Fg3Gmd7n7x3XqbNXUxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372370;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvUU/lB/oIMvrEYW+eB0/gBkIeV3CTDi81+D5y4HuKE=;
	b=o3mIIiW71OwNAwJ9eRTTKn5JUYR+eulqHobW8aFFxscj4E0TTVr02V/38NbaJpCFq2Pb
	 BylW+83NKmkZ4iFOFsG7zFK/opYaWL98ymj2GUQKmGG8DN3kuXALjlrkJhD0r89BaznFv
	 o3VXvhsNTS7WfSCLzpKIKvxJDTpHNmXiwZs3WVgm/ryKb21/S5OVNFuam+nKun9YDngln
	 LDCvcaXnaIfey/3ez3i/6mpmdgBSpk4IAcE9AoZljZ02x/S5jkY1NynR6ru0/NJh7aifB
	 RRRXIBfqEszna4QYbgTYpd4F3JmZGeqPP49ieBLP7p9ZQEmTELwXFr304kthbXV/3cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ff+bC01N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A432606A31A;
	Fri, 30 Oct 2026 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ff+bC01N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619981F0093A;
	Fri, 30 Oct 2026 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372369;
	bh=OvUU/lB/oIMvrEYW+eB0/gBkIeV3CTDi81+D5y4HuKE=;
	h=From:To:Cc:Subject:Date;
	b=ff+bC01NKaJDK0mNldE6OkS9O3OiphoGi5RAFxGOqZRndr4cLDv8A7XEwX0Nk6ORb
	 MxKUZMmoVsobUVAMhptf+JZzmj6oUoXf7ilUyhh1OWgj18kPlDo6UPJOYhnxO9jSk1
	 qjVL9AhSxExBNawmxm5QPwKNyplgaA1BeOOxdc/47ey7BKULlQ3IJK6VMxFDVcQQEX
	 YOxGQYKB/WeL5bXvbzHX4rj7MB82tsAit9V0xUGJCks5ByENsGCOkbfg79KAY0IJ7F
	 cMEkMQRhCAx3v86H1Q/TGS4T2XDtil+i2Eun9MFH34m1P8N+y5m1t9WBb3yb+jIE6/
	 T7PhvXrKd7XxA==
From: Joshua Crofts <crofts@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] dmaengine: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Fri, 30 Oct 2026 14:58:58 +0000
Message-ID: <20261030145901.1393-1-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Joshua Crofts (3):
  dmaengine: at_xdmac: remove redundant
    pm_runtime_dont_use_autosuspend() calls
  dmaengine: qcom: remove redundant pm_runtime_dont_use_autosuspend()
    calls
  dmaengine: ti: remove redundant pm_runtime_dont_use_autosuspend()
    calls

 drivers/dma/at_xdmac.c     | 2 --
 drivers/dma/qcom/bam_dma.c | 1 -
 drivers/dma/ti/cppi41.c    | 5 +----
 3 files changed, 1 insertion(+), 7 deletions(-)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.47.3

