Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14A04A98A
	for <dmaengine@vger.kernel.org>; Mon, 11 Dec 2023 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqC2AbIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7FAC433C7;
	Mon, 11 Dec 2023 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702307042;
	bh=51NDDSCHIGZloICs3aR7G9RVWbUodymkhQPcRylmBxc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MqC2AbIlfT3kQCMaUHNlyu73kZhszyPF7xjuulKSLUeNuWnOxRqAa1zqVqb3fIVl3
	 fot+C+rv5jW7VECNNO5/yH5IkSaW9qSoUzTjDWKevr5c0EXK6tdO+HT6NNLYVGkNRR
	 0k8EWWUGzcB0wzdD6VuZpF/BdENmiF+WbOEuiz8TUBOs0WFXKA6hcBQ64Q+D6T7z2w
	 g5dLNGL/crP7YIotTklAv+1bhVlSfZT8PDeFT1CF8GjDhtBfGjo1zhP1yCCAbrcpOf
	 AgSGpwHqvVTBa21G2dczDrSXb3jdUIztRmjEBww5kEGzMCkKzNH/U4xxvt1dU8KUFr
	 4ANsglQHb8Y1Q==
From: Vinod Koul <vkoul@kernel.org>
To: dave.jiang@intel.com, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, tony.luck@intel.com, fenghua.yu@intel.com, 
 'Guanjun' <guanjun@linux.alibaba.com>
Cc: jing.lin@intel.com, ashok.raj@intel.com, sanjay.k.kumar@intel.com, 
 megha.dey@intel.com, jacob.jun.pan@intel.com, yi.l.liu@intel.com, 
 tglx@linutronix.de
In-Reply-To: <20231211053704.2725417-1-guanjun@linux.alibaba.com>
References: <20231211053704.2725417-1-guanjun@linux.alibaba.com>
Subject: Re: [PATCH v5 0/2] Some fixes for idxd driver
Message-Id: <170230703837.319897.17521835974677440707.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 20:33:58 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Mon, 11 Dec 2023 13:37:02 +0800, 'Guanjun' wrote:
> As we talked in v1 and v2, I add fixes tag in patch 0 and change some
> descriptions in patch 1.
> 
> Hi Lijun,
> According to your comments, I change the fix tag to commit
> eb0cf33a91b4(dmaengine: idxd: move interrupt handle assignment)
> 
> [...]

Applied, thanks!

[1/2] dmaengine: idxd: Protect int_handle field in hw descriptor
      commit: 778dfacc903d4b1ef5b7a9726e3a36bc15913d29
[2/2] dmaengine: idxd: Fix incorrect descriptions for GRPCFG register
      commit: 0c154698a0fc32957d00c6009d5389e086dc8acf

Best regards,
-- 
~Vinod


