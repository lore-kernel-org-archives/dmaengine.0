Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF92C3955C7;
	Tue, 15 Sep 2026 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491140; cv=none; b=BkKjCYiKRQjw1y2+rytVlRGE/pp/7/nhw4KPiRVYuxMb0fKEO5TJEgqpo6XO3cTp8IJh3Qp5tfFCaHJytDVqXt0zPBTmIQk440AUf5o/G8IiCfQC4M3Ic3VHOnFxJ6FsSdujWZzopmKqfnEUjtnnYcqQ6QIJuJNHpKEuegGRfOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491140; c=relaxed/simple;
	bh=PU1ZBYLtPyWlS3f11aczdUgBYjFBdo/l1BYxOOPFQPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VyJLKVlxR0/gOrwr/ytcKvdGkbbUTGVDmLDvbFxgyAOKjaOe280l/iRnhZAXDKiDU4k25UOVyR4Dlts8AR4PU5QXu6mdSku46QZsMTJ82Xty+2SIly1RRxW3GE+wrljYe2TowOEHwy0AXmCtr9wnlurMzVv1DptEdURn6JoTMYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdFepHrS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdFepHrS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CB81F000FF;
	Tue, 15 Sep 2026 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491139;
	bh=vGLteVyurop72p8n+/8/seuxbzWghU7KeWGJfisttCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XdFepHrSBrLU92XV0qMsozAeZodcESLEozj0h6gJ6X0MLjRIAdKZFyv5nZeMLkYLj
	 k1rFuTUH23AtsvzayAYEhX3lzFg40iBeWedzbTivAYhYVYfIrNQ6Uint4bpucatZ41
	 ZqsmuNfi5BX1pHMVGzftAL+Jsfy9sTmxVjQcbYKnLWZjsdthBTbTEB6z3+jCJNuLZE
	 zCfsklStm7KQwAhloLWvGqCKWYIyuZl5DiaFFAIgxIQz3vqEychU1Mj7PLrVA8kSGC
	 9n9jQaBXepFzcCwX+UjBWnfK2MDXoJtCqfB3pkcemzQYaG3ksvPImy+isdMF3KdrGg
	 3sBXFo0QZsWBw==
From: Vinod Koul <vkoul@kernel.org>
To: Baineng Shou <shoubaineng@gmail.com>
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260910021652.1296640-1-shoubaineng@gmail.com>
References: <aqHJKbBTNrreoMuI@SMW015318>
 <20260910021652.1296640-1-shoubaineng@gmail.com>
Subject: Re: [PATCH v2] dmaengine: mmp_pdma: fix wrong sg length in
 mmp_pdma_prep_slave_sg()
Message-Id: <178949113805.182389.3552066048439179388.b4-ty@kernel.org>
Date: Tue, 15 Sep 2026 22:22:18 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 10 Sep 2026 10:16:52 +0800, Baineng Shou wrote:
> In mmp_pdma_prep_slave_sg(), for_each_sg() iterates the scatterlist
> putting each entry into 'sg', but the entry length is read from 'sgl'
> (the list head) instead of 'sg' (the current entry):
> 
>     for_each_sg(sgl, sg, sg_len, i) {
>         addr = sg_dma_address(sg);
>         avail = sg_dma_len(sgl);   /* should be 'sg' */
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg()
      commit: 075bc7b1d3dde5ed43fbaabbc1a69f09b7fc3a47

Best regards,
-- 
~Vinod


