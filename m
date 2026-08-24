Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EED43F08D;
	Mon, 24 Aug 2026 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587327; cv=none; b=qlDIeqK5qitmg76r7iSh0MBh54/MRPFY8o0ELq7A9yUSQRXYqR6FN0I3Km2W0SY0X/n4Bf0p6iuncNADqbzQQjSd/bhmgQl7WHOAWYqL8bKZGzFhiptOpr87RXrV9meEBzDhiKj/XjK6hdVfxBSZI7sL/tD/C/N4kt2dsEMnxyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587327; c=relaxed/simple;
	bh=ny50pXao9+hiGG++uQ0lPNnCHDvOpt/UHG7/er4/oWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ja8mKikFAkKeId+spOZ1z3kqfiZTCd1uWLZFq+dZQh+JkATQpKD5cYKexn+BJ2j43BHYF4mdbtZrQPGxgCSzsUI5sYo1UKPFZ/DvhTvgwA7S9eBVc+AMMfbmVdfHa9wwmuq3pOFEaytISDX3wVRYapwxknfWWB0RUols1DzOUgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uq54yAxD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uq54yAxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787587326; x=1819123326;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=ny50pXao9+hiGG++uQ0lPNnCHDvOpt/UHG7/er4/oWQ=;
  b=Uq54yAxDioxrDAhvll+fbo/hhKamVzIRJdG293sIY0l+q3UK/uYwriYp
   1sqEQXuo0oN4NQLMBcE1bTeMyrH5sxOvBpfZBWQdGmTlOtwANVI8o3YEV
   WdNFyN2vbDjytc7w0jJRNCUJon/sG79UMl9IOgz/6PE0AxKxRnXg22h4R
   XEXSumJwSbWpDc1EYNNDkmYjhbrDybzk1azZdA9b2dm/jRUv/2AIvAGdP
   UjRVDPUEmIug6/hESnZ11e5gtdHfijpvF6Hi2bNjU66MIKZnqvxJ8vfx+
   Px0JT8c26RW27AyKTUNILgyIyjKrWPtMBNrmHlYWh7f+Lui7TMNTUQ/lF
   A==;
X-CSE-ConnectionGUID: e9UQudY2Scy2HA/EoVlTwQ==
X-CSE-MsgGUID: DyXDZYALQe+wiT/kPAzhxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="86994274"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="86994274"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:02:05 -0700
X-CSE-ConnectionGUID: +dBJa4oMS/qcDBX3IUxexA==
X-CSE-MsgGUID: 5OP7oru7T+m6mHF/l93yiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="263766776"
Received: from jjgreens-desk24.amr.corp.intel.com (HELO [10.125.108.201]) ([10.125.108.201])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:02:04 -0700
Message-ID: <e5ad7537-7e36-4f3a-88f5-23001362afc8@intel.com>
Date: Mon, 24 Aug 2026 09:02:02 -0700
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [dmaengine?] BUG: unable to handle kernel paging request
 in ioat_pci_probe
To: syzbot <syzbot+79a6b3f7a8df01f58774@syzkaller.appspotmail.com>,
 Frank.Li@kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 vkoul@kernel.org
References: <6a891a2c.91706f20.16b6e3.02b1.GAE@google.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <6a891a2c.91706f20.16b6e3.02b1.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/21/26 8:40 PM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    9d2ed026f031 Merge tag 'sysctl-7.03-rc1' of git://git.kern..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11837a25580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=54b748b029440e0b
> dashboard link: https://syzkaller.appspot.com/bug?extid=79a6b3f7a8df01f58774
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> userspace arch: i386
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10830415580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-9d2ed026.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6c5c2e657d2b/vmlinux-9d2ed026.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4d4c9e33af49/bzImage-9d2ed026.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+79a6b3f7a8df01f58774@syzkaller.appspotmail.com

This is not a real bug. In order to reproduce, the attacker must already have root access. And it needs to force bind the ioatdma driver to an arbitrary device that has I/O port as BAR0 instead of MMIO. While we can add a check in the driver to block that, I don't think it's necessary at this point.

DJ

> 
> BUG: unable to handle page fault for address: 000000000001c0a8
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 5523b067 P4D 5523b067 PUD 4c5b0067 PMD 0 
> Oops: Oops: 0000 [#1] SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 5910 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:readb arch/x86/include/asm/io.h:57 [inline]
> RIP: 0010:ioat_pci_probe+0x169/0x2880 drivers/dma/ioat/init.c:1365
> Code: 4d 2f d3 ff 48 89 c3 48 85 c0 0f 84 de 1f 00 00 e8 cc 50 7c fc 48 89 d8 48 c1 e8 03 42 80 3c 28 00 0f 85 ec 25 00 00 48 8b 03 <44> 8a 68 08 bf 2f 00 00 00 44 89 ee e8 b6 4a 7c fc 41 80 fd 2f 0f
> RSP: 0018:ffffc90002daf7c8 EFLAGS: 00010246
> RAX: 000000000001c0a0 RBX: ffff888028961238 RCX: 0000000000000000
> RDX: ffff888029bc8000 RSI: ffffffff858deac4 RDI: 0000000000000001
> RBP: ffff888021572000 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
> R13: dffffc0000000000 R14: ffffffff858de970 R15: ffff888021572130
> FS:  0000000000000000(0000) GS:ffff8880969bd000(0063) knlGS:00000000571be480
> CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> CR2: 000000000001c0a8 CR3: 0000000055268000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  local_pci_probe+0xdd/0x1b0 drivers/pci/pci-driver.c:332
>  pci_call_probe+0x176/0x800 drivers/pci/pci-driver.c:394
>  __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
>  pci_device_probe+0x1cd/0x370 drivers/pci/pci-driver.c:489
>  call_driver_probe drivers/base/dd.c:628 [inline]
>  really_probe+0x241/0xa60 drivers/base/dd.c:706
>  __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
>  device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
>  bind_store+0xf4/0x190 drivers/base/bus.c:267
>  drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
>  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x6af/0x1050 fs/read_write.c:687
>  ksys_write+0x12a/0x250 fs/read_write.c:739
>  do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
>  __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
>  do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
>  entry_SYSENTER_compat_after_hwframe+0x84/0x8e
> RIP: 0023:0xf709efec
> Code: Unable to access opcode bytes at 0xf709efc2.
> RSP: 002b:00000000ff94267c EFLAGS: 00000292 ORIG_RAX: 0000000000000004
> RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 0000000080000600
> RDX: 000000000000000d RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>  </TASK>
> Modules linked in:
> CR2: 000000000001c0a8
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:readb arch/x86/include/asm/io.h:57 [inline]
> RIP: 0010:ioat_pci_probe+0x169/0x2880 drivers/dma/ioat/init.c:1365
> Code: 4d 2f d3 ff 48 89 c3 48 85 c0 0f 84 de 1f 00 00 e8 cc 50 7c fc 48 89 d8 48 c1 e8 03 42 80 3c 28 00 0f 85 ec 25 00 00 48 8b 03 <44> 8a 68 08 bf 2f 00 00 00 44 89 ee e8 b6 4a 7c fc 41 80 fd 2f 0f
> RSP: 0018:ffffc90002daf7c8 EFLAGS: 00010246
> RAX: 000000000001c0a0 RBX: ffff888028961238 RCX: 0000000000000000
> RDX: ffff888029bc8000 RSI: ffffffff858deac4 RDI: 0000000000000001
> RBP: ffff888021572000 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
> R13: dffffc0000000000 R14: ffffffff858de970 R15: ffff888021572130
> FS:  0000000000000000(0000) GS:ffff8880969bd000(0063) knlGS:00000000571be480
> CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> CR2: 00000000f709f000 CR3: 0000000055268000 CR4: 0000000000352ef0
> ----------------
> Code disassembly (best guess):
>    0:	4d 2f                	rex.WRB (bad)
>    2:	d3 ff                	sar    %cl,%edi
>    4:	48 89 c3             	mov    %rax,%rbx
>    7:	48 85 c0             	test   %rax,%rax
>    a:	0f 84 de 1f 00 00    	je     0x1fee
>   10:	e8 cc 50 7c fc       	call   0xfc7c50e1
>   15:	48 89 d8             	mov    %rbx,%rax
>   18:	48 c1 e8 03          	shr    $0x3,%rax
>   1c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
>   21:	0f 85 ec 25 00 00    	jne    0x2613
>   27:	48 8b 03             	mov    (%rbx),%rax
> * 2a:	44 8a 68 08          	mov    0x8(%rax),%r13b <-- trapping instruction
>   2e:	bf 2f 00 00 00       	mov    $0x2f,%edi
>   33:	44 89 ee             	mov    %r13d,%esi
>   36:	e8 b6 4a 7c fc       	call   0xfc7c4af1
>   3b:	41 80 fd 2f          	cmp    $0x2f,%r13b
>   3f:	0f                   	.byte 0xf
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 

