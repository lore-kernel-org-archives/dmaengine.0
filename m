Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FF14CC261;
	Mon,  5 Oct 2026 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214998; cv=none; b=Y+v/VgyXlZcCj/J1pGVUT0HX+4C3VrwwdiTTFO9Gx9/GSNck96J4Xc7zD2f042Zv0l2hvLYIyKlE2t3UHxr44/UmE2UppBLB7Nfl6bSLQt3nzSaAuLzPcSuTyg/yE/b56k/+6hJeRjkFYT1rjP+8N/UbuUnmjU4wQtIPoBlKa4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214998; c=relaxed/simple;
	bh=JfAcRDJFIy3Rnb/rCtKFtqLSnkQeG3WZgnV+/wm1TDE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K57ma41P+H+nyiSGjn+C3+dLaTJqFp7kpDyl0yieoDTunoV72RpzxCAQVE5ftKTYHrQgvZdSKSkcFtK++1rYhUEZbF11mrP1uhL2YbAi2+sdx0hBSYhkjxFL2pWnAm4cXQJeTqc0E/hnipMHSiV6ZSD+M3cFB3n1daOmDHJA2VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCvZupSG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCvZupSG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F531F000FF;
	Mon,  5 Oct 2026 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214996;
	bh=EUFK7xAyFkED37jIHcrt1YvGxO5hCbNQEnhxKuLKlQQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TCvZupSGFMxL1QWljkDfqzGVFKIBlbB/xPCBa9BTtr2f9RqsbjUOg92nTpaygTnZg
	 oN5BHbaQV9x8ErNY5ExE2EY/BgQFXEtulqT2UO+Rfs4p/solNqjk7vzlMepPK4K2ym
	 r9D9PuAGnWSQ5C07i8KuK33l+Q9uPeo5iWo6kQkYV0Cngs8mserFKA21WGTXk5Qu77
	 V0TmrJTp72U3GRB/0LW69757NH8ziqlF6p4ARfKeJbiYn9Np0MCOgtX/knvS621NMq
	 s7AKiU+Re5PxQ/Pbs7887XQf2anUxGrjeOiJoZwcDqDzJdcBVLGLrXLec38qaAO1W7
	 LDtAohp5SZ8mQ==
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Bogdan Mahomet <bogdan.mahomet.dev@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, dmaengine@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260822001536.29269-1-bogdan.mahomet.dev@gmail.com>
References: <20260822001536.29269-1-bogdan.mahomet.dev@gmail.com>
Subject: Re: [PATCH] docs: dmaengine: document ownership of the descriptor
 flags field
Message-Id: <179121499463.358863.15589593850108897445.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:14 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sat, 22 Aug 2026 03:15:30 +0300, Bogdan Mahomet wrote:
> The flags field of struct dma_async_tx_descriptor has carried a TODO
> since the provider documentation was added in 2014, asking whether a
> driver may modify the field itself or whether it must always hold the
> flags passed in the arguments.
> 
> The field belongs to the client. dma_async_tx_descriptor_init() does
> not touch it, so the provider has to set it, and providers store the
> flags they were given verbatim; vchan_tx_prep() does this for every
> driver built on top of virt-dma. Afterwards providers only read the
> field: the DMA_PREP_* bits are consumed while the descriptor is being
> prepared, and DMA_CTRL_ACK and DMA_CTRL_REUSE are tested with
> async_tx_test_ack() and dmaengine_desc_test_reuse() before a
> descriptor is recycled or freed.
> 
> [...]

Applied, thanks!

[1/1] docs: dmaengine: document ownership of the descriptor flags field
      commit: ef399305a5bf64231059c63a53f3384eb59c2458

Best regards,
-- 
~Vinod


