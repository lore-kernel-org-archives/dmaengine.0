Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA719381EA5;
	Thu,  2 Jul 2026 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005934; cv=none; b=Q/fQoi2LrE8kBIaEUyiUuJSFnUfdpMsXx9vD3am/uIRd3H8idtWHAYiXSQh+cQ1nPYEla8xVMi1vxkhjlM8hUgCfwkwm/A7tzOx9cVB3hK3mmC9pyFoPJvLJ3m9en3rXAa5GcbzDqQ1a4jlOgTt4lmsiZaoJ4CegIjbW6a1bUFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005934; c=relaxed/simple;
	bh=xj5s7WY+QLQUy8AfL07dCQIIJdpNmdH1DCaF0zyc43w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mDwONwJmtcLqNE2ybdPzSHcUWJs+ypYQXIIqZZW1ROK4hDrk2gtrfPHSv1sBz/ZppL5zgfT9VJ2F/hInV02Eb2enPOZtNnd53tiwlaeC3QYX4FQGdZsAbhOkv1MYjEq6fWqK5C19PBYNfm0iXgkm46KP7Zk+DkXGc8WBfq+2Dxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0PhNZuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0PhNZuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2C31F00A3A;
	Thu,  2 Jul 2026 15:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005933;
	bh=BkCp8+eEHAV99V9AXfR1dKbJ9C/llthtkDgqG+qt64g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=K0PhNZuhHvIhoOs32p/Oy3Y7LIfLGgkVvqa/UucJXeFRPCqNqLLXoXGz7dI3sVPF8
	 1+tTZLC3F1Ffmq70iL9fG61hi3N1NFE0GBlrtujfxGoIu3QsBwhfXcNDfj/zhE+Pea
	 R8fI3rhp0cY4UC/MpskNGv2JfNX2FQGCLd9CvHV8b/4RpIKmqZ/ZPhD++2dHt6ZxEY
	 BK/Wtw6njP0x5NV4jlOyJFvB4471EzWAKGssnX8pqc81j6iLv5brtEkt2xJpzddD+E
	 vP4y2NYpPQpATIcHYqug+e5JGpey8X+ZPphYuiqxBWKXihMSZoMWn/AIcaIMZaGnaF
	 JEh4esO3lNhiQ==
From: Vinod Koul <vkoul@kernel.org>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Yuho Choi <dbgh9129@gmail.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Frank Li <Frank.Li@kernel.org>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260415205452.67155-1-dbgh9129@gmail.com>
References: <20260415205452.67155-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] dmaengine: idxd: fix double free of wq, engine, and
 group structs
Message-Id: <178300593132.726714.650968686982910854.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 20:55:31 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 15 Apr 2026 16:54:52 -0400, Yuho Choi wrote:
> The release callbacks for wq, engine, and group devices
> (idxd_conf_wq_release, idxd_conf_engine_release,
> idxd_conf_group_release) each call kfree() on the enclosing struct.
> The setup error paths and cleanup functions also call kfree()
> explicitly after put_device(), producing a double free whenever
> put_device() drops the reference count to zero and fires the release.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: idxd: fix double free of wq, engine, and group structs
      commit: ec2d428b2e32dd157de8f86a86dd85c5b2c8f45c

Best regards,
-- 
~Vinod


